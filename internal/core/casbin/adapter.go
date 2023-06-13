package casbin

import (
	"context"
	"errors"
	"fmt"
	"math"
	"strings"

	"github.com/casbin/casbin/v2/model"
	"github.com/casbin/casbin/v2/persist"
	"github.com/gogf/gf/v2/database/gdb"
)

const (
	defaultTableName       = "casbin_policy"
	dropPolicyTableSql     = `DROP TABLE IF EXISTS %s`
	truncatePolicyTableSql = `TRUNCATE TABLE %s`
	createPolicyTableSql   = `
CREATE TABLE IF NOT EXISTS %s (
	id bigint(20) NOT NULL AUTO_INCREMENT,
	ptype VARCHAR(10) NOT NULL DEFAULT '',
	v0 VARCHAR(256) NOT NULL DEFAULT '',
	v1 VARCHAR(256) NOT NULL DEFAULT '',
	v2 VARCHAR(256) NOT NULL DEFAULT '',
	v3 VARCHAR(256) NOT NULL DEFAULT '',
	v4 VARCHAR(256) NOT NULL DEFAULT '',
	v5 VARCHAR(256) NOT NULL DEFAULT '',
	PRIMARY KEY (id)
) COMMENT = '授权策略表';
`
)

var (
	ErrInvalidDatabaseLink = errors.New("invalid database link")
	policyColumns          = defaultPolicyColumns{
		PType: "ptype",
		V0:    "v0",
		V1:    "v1",
		V2:    "v2",
		V3:    "v3",
		V4:    "v4",
		V5:    "v5",
	}
)

type (
	Adapter struct {
		db         gdb.DB
		table      string
		isFiltered bool
	}

	defaultPolicyColumns struct {
		PType string // ptype
		V0    string // V0
		V1    string // V1
		V2    string // V2
		V3    string // V3
		V4    string // V4
		V5    string // V5
	}

	// PolicyRule policy rule entity
	PolicyRule struct {
		PType string `orm:"ptype" json:"ptype"`
		V0    string `orm:"v0" json:"v0"`
		V1    string `orm:"v1" json:"v1"`
		V2    string `orm:"v2" json:"v2"`
		V3    string `orm:"v3" json:"v3"`
		V4    string `orm:"v4" json:"v4"`
		V5    string `orm:"v5" json:"v5"`
	}

	Filter struct {
		Ptype []string
		V0    []string
		V1    []string
		V2    []string
		V3    []string
		V4    []string
		V5    []string
	}

	BatchFilter struct {
		filters []Filter
	}
)

// Create a casbin adapter
func newAdapter(db gdb.DB, link, table string, isFiltered bool) (adp *Adapter, err error) {
	adp = &Adapter{db, table, isFiltered}

	if adp.db == nil {
		config := strings.SplitN(link, ":", 2)

		if len(config) != 2 {
			err = ErrInvalidDatabaseLink
			return
		}

		if adp.db, err = gdb.New(gdb.ConfigNode{Type: config[0], Link: config[1]}); err != nil {
			return
		}
	}

	if adp.table == "" {
		adp.table = defaultTableName
	}

	err = adp.createPolicyTable()

	return
}

func NewAdapterByDB(db gdb.DB, table string, isFiltered bool) (adp *Adapter, err error) {
	return newAdapter(db, "", table, isFiltered)
}

func NewAdapterByLink(link, table string, isFiltered bool) (adp *Adapter, err error) {
	return newAdapter(nil, link, table, isFiltered)
}

func (a *Adapter) model() *gdb.Model {
	return a.db.Model(a.table).Safe().Ctx(context.TODO())
}

// 如果策略表不存在则创建
func (a *Adapter) createPolicyTable() (err error) {
	_, err = a.db.Exec(context.TODO(), fmt.Sprintf(createPolicyTableSql, a.table))

	return
}

// 删除策略表
func (a *Adapter) dropPolicyTable() (err error) {
	_, err = a.db.Exec(context.TODO(), fmt.Sprintf(dropPolicyTableSql, a.table))

	return
}

// 截断策略表
func (a *Adapter) truncatePolicyTable() (err error) {
	_, err = a.db.Exec(context.TODO(), fmt.Sprintf(truncatePolicyTableSql, a.table))

	return
}

// LoadPolicy loads all policy rules from the storage.
func (a *Adapter) LoadPolicy(model model.Model) (err error) {
	var rules []PolicyRule

	if err = a.model().Scan(&rules); err != nil {
		return
	}

	for _, rule := range rules {
		a.loadPolicyRule(rule, model)
	}

	return
}

// SavePolicy Saves all policy rules to the storage.
func (a *Adapter) SavePolicy(model model.Model) (err error) {
	if err = a.dropPolicyTable(); err != nil {
		return
	}

	if err = a.createPolicyTable(); err != nil {
		return
	}

	policyRules := make([]PolicyRule, 0)

	for ptype, ast := range model["p"] {
		for _, rule := range ast.Policy {
			policyRules = append(policyRules, a.buildPolicyRule(ptype, rule))
		}
	}

	for ptype, ast := range model["g"] {
		for _, rule := range ast.Policy {
			policyRules = append(policyRules, a.buildPolicyRule(ptype, rule))
		}
	}

	if count := len(policyRules); count > 0 {
		if _, err = a.model().Insert(policyRules); err != nil {
			return
		}
	}

	return
}

// AddPolicy adds a policy rule to the storage.
func (a *Adapter) AddPolicy(sec string, ptype string, rule []string) (err error) {
	_, err = a.model().Insert(a.buildPolicyRule(ptype, rule))

	return
}

// AddPolicies adds policy rules to the storage.
func (a *Adapter) AddPolicies(sec string, ptype string, rules [][]string) (err error) {
	if len(rules) == 0 {
		return
	}

	policyRules := make([]PolicyRule, 0, len(rules))

	for _, rule := range rules {
		policyRules = append(policyRules, a.buildPolicyRule(ptype, rule))
	}

	_, err = a.model().Insert(policyRules)

	return
}

// RemovePolicy removes a policy rule from the storage.
func (a *Adapter) RemovePolicy(sec string, ptype string, rule []string) error {
	return a.deletePolicyRule(a.buildPolicyRule(ptype, rule))
}

// RemoveFilteredPolicy removes policy rules that match the filter from the storage.
func (a *Adapter) RemoveFilteredPolicy(sec string, ptype string, fieldIndex int, fieldValues ...string) error {
	rule := PolicyRule{PType: ptype}

	if fieldIndex <= 0 && 0 < fieldIndex+len(fieldValues) {
		rule.V0 = fieldValues[0-fieldIndex]
	}

	if fieldIndex <= 1 && 1 < fieldIndex+len(fieldValues) {
		rule.V1 = fieldValues[1-fieldIndex]
	}

	if fieldIndex <= 2 && 2 < fieldIndex+len(fieldValues) {
		rule.V2 = fieldValues[2-fieldIndex]
	}

	if fieldIndex <= 3 && 3 < fieldIndex+len(fieldValues) {
		rule.V3 = fieldValues[3-fieldIndex]
	}

	if fieldIndex <= 4 && 4 < fieldIndex+len(fieldValues) {
		rule.V4 = fieldValues[4-fieldIndex]
	}

	if fieldIndex <= 5 && 5 < fieldIndex+len(fieldValues) {
		rule.V5 = fieldValues[5-fieldIndex]
	}

	return a.deletePolicyRule(rule)
}

// RemovePolicies removes policy rules from the storage (implements the persist.BatchAdapter interface).
func (a *Adapter) RemovePolicies(sec string, ptype string, rules [][]string) (err error) {
	db := a.model()

	for _, rule := range rules {
		where := map[string]interface{}{policyColumns.PType: ptype}

		for i := 0; i <= 5; i++ {
			if len(rule) > i {
				where[fmt.Sprintf("v%d", i)] = rule[i]
			}
		}

		db = db.WhereOr(where)
	}

	_, err = db.Delete()

	return
}

// UpdatePolicy updates a policy rule from storage.
func (a *Adapter) UpdatePolicy(sec string, ptype string, oldRule, newRule []string) (err error) {
	_, err = a.model().Update(a.buildPolicyRule(ptype, newRule), a.buildPolicyRule(ptype, oldRule))

	return
}

// UpdatePolicies updates some policy rules to storage, like db, redis.
func (a *Adapter) UpdatePolicies(sec string, ptype string, oldRules, newRules [][]string) (err error) {
	if len(oldRules) == 0 || len(newRules) == 0 {
		return
	}

	err = a.model().Transaction(context.TODO(), func(ctx context.Context, tx gdb.TX) error {
		for i := 0; i < int(math.Min(float64(len(oldRules)), float64(len(newRules)))); i++ {
			if _, err = tx.Model(a.table).Update(a.buildPolicyRule(ptype, newRules[i]), a.buildPolicyRule(ptype, oldRules[i])); err != nil {
				return err
			}
		}

		return nil
	})

	return
}

// UpdateFilteredPolicies deletes old rules and adds new rules.
func (a *Adapter) UpdateFilteredPolicies(sec string, ptype string, newRules [][]string, fieldIndex int, fieldValues ...string) ([][]string, error) {
	line := &PolicyRule{}

	line.PType = ptype
	if fieldIndex <= 0 && 0 < fieldIndex+len(fieldValues) {
		line.V0 = fieldValues[0-fieldIndex]
	}
	if fieldIndex <= 1 && 1 < fieldIndex+len(fieldValues) {
		line.V1 = fieldValues[1-fieldIndex]
	}
	if fieldIndex <= 2 && 2 < fieldIndex+len(fieldValues) {
		line.V2 = fieldValues[2-fieldIndex]
	}
	if fieldIndex <= 3 && 3 < fieldIndex+len(fieldValues) {
		line.V3 = fieldValues[3-fieldIndex]
	}
	if fieldIndex <= 4 && 4 < fieldIndex+len(fieldValues) {
		line.V4 = fieldValues[4-fieldIndex]
	}
	if fieldIndex <= 5 && 5 < fieldIndex+len(fieldValues) {
		line.V5 = fieldValues[5-fieldIndex]
	}

	newP := make([]PolicyRule, 0, len(newRules))
	oldP := make([]PolicyRule, 0)
	for _, newRule := range newRules {
		newP = append(newP, a.buildPolicyRule(ptype, newRule))
	}
	if err := a.model().Where(line).Scan(&oldP); err != nil {
		return nil, err
	}

	err := a.model().Transaction(context.TODO(), func(ctx context.Context, tx gdb.TX) error {
		if _, err := tx.Model(a.table).Delete(line); err != nil {
			return err
		}
		if _, err := tx.Model(a.table).Insert(newP); err != nil {
			return err
		}
		return nil
	})
	if err != nil {
		return nil, err
	}

	// return deleted rulues
	oldPolicies := make([][]string, 0)
	for _, v := range oldP {
		oldPolicy := v.toStringPolicy()
		oldPolicies = append(oldPolicies, oldPolicy)
	}
	return oldPolicies, nil
}

// LoadFilteredPolicy loads only policy rules that match the filter.
func (a *Adapter) LoadFilteredPolicy(model model.Model, filter interface{}) error {
	var lines []PolicyRule

	batchFilter := BatchFilter{
		filters: []Filter{},
	}
	switch filterValue := filter.(type) {
	case Filter:
		batchFilter.filters = []Filter{filterValue}
	case *Filter:
		batchFilter.filters = []Filter{*filterValue}
	case []Filter:
		batchFilter.filters = filterValue
	case BatchFilter:
		batchFilter = filterValue
	case *BatchFilter:
		batchFilter = *filterValue
	default:
		return errors.New("unsupported filter type")
	}

	for _, f := range batchFilter.filters {
		m := a.model()
		if len(f.Ptype) > 0 {
			m = m.WhereIn(policyColumns.PType, f.Ptype)
		}
		if len(f.V0) > 0 {
			m = m.WhereIn(policyColumns.V0, f.V0)
		}
		if len(f.V1) > 0 {
			m = m.WhereIn(policyColumns.V1, f.V1)
		}
		if len(f.V2) > 0 {
			m = m.WhereIn(policyColumns.V2, f.V2)
		}
		if len(f.V3) > 0 {
			m = m.WhereIn(policyColumns.V3, f.V3)
		}
		if len(f.V4) > 0 {
			m = m.WhereIn(policyColumns.V4, f.V4)
		}
		if len(f.V5) > 0 {
			m = m.WhereIn(policyColumns.V5, f.V5)
		}
		if err := m.Order("ID").Scan(&lines); err != nil {
			return err
		}

		for _, line := range lines {
			err := loadPolicyLine(line, model)
			if err != nil {
				return err
			}
		}
	}
	a.isFiltered = true

	return nil
}

// IsFiltered returns true if the loaded policy has been filtered.
func (a *Adapter) IsFiltered() bool {
	return a.isFiltered
}

func loadPolicyLine(line PolicyRule, model model.Model) error {
	var p = []string{line.PType,
		line.V0, line.V1, line.V2,
		line.V3, line.V4, line.V5}

	index := len(p) - 1
	for p[index] == "" {
		index--
	}
	index += 1
	p = p[:index]
	err := persist.LoadPolicyArray(p, model)
	if err != nil {
		return nil
	}
	return err
}

// 加载策略规则
func (a *Adapter) loadPolicyRule(rule PolicyRule, model model.Model) {
	ruleText := rule.PType

	if rule.V0 != "" {
		ruleText += ", " + rule.V0
	}

	if rule.V1 != "" {
		ruleText += ", " + rule.V1
	}

	if rule.V2 != "" {
		ruleText += ", " + rule.V2
	}

	if rule.V3 != "" {
		ruleText += ", " + rule.V3
	}

	if rule.V4 != "" {
		ruleText += ", " + rule.V4
	}

	if rule.V5 != "" {
		ruleText += ", " + rule.V5
	}

	persist.LoadPolicyLine(ruleText, model)
}

// 构建策略规则
func (a *Adapter) buildPolicyRule(ptype string, data []string) PolicyRule {
	rule := PolicyRule{PType: ptype}

	if len(data) > 0 {
		rule.V0 = data[0]
	}

	if len(data) > 1 {
		rule.V1 = data[1]
	}

	if len(data) > 2 {
		rule.V2 = data[2]
	}

	if len(data) > 3 {
		rule.V3 = data[3]
	}

	if len(data) > 4 {
		rule.V4 = data[4]
	}

	if len(data) > 5 {
		rule.V5 = data[5]
	}

	return rule
}

// deletes a policy rule.
func (a *Adapter) deletePolicyRule(rule PolicyRule) (err error) {
	where := map[string]interface{}{policyColumns.PType: rule.PType}

	if rule.V0 != "" {
		where[policyColumns.V0] = rule.V0
	}

	if rule.V1 != "" {
		where[policyColumns.V1] = rule.V1
	}

	if rule.V2 != "" {
		where[policyColumns.V2] = rule.V2
	}

	if rule.V3 != "" {
		where[policyColumns.V3] = rule.V3
	}

	if rule.V4 != "" {
		where[policyColumns.V4] = rule.V4
	}

	if rule.V5 != "" {
		where[policyColumns.V5] = rule.V5
	}

	_, err = a.model().Delete(where)

	return
}

func (c *PolicyRule) toStringPolicy() []string {
	policy := make([]string, 0)
	if c.PType != "" {
		policy = append(policy, c.PType)
	}
	if c.V0 != "" {
		policy = append(policy, c.V0)
	}
	if c.V1 != "" {
		policy = append(policy, c.V1)
	}
	if c.V2 != "" {
		policy = append(policy, c.V2)
	}
	if c.V3 != "" {
		policy = append(policy, c.V3)
	}
	if c.V4 != "" {
		policy = append(policy, c.V4)
	}
	if c.V5 != "" {
		policy = append(policy, c.V5)
	}
	return policy
}
