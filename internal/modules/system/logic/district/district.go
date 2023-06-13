package district

import (
	"context"
	"fmt"
	"github.com/gogf/gf/v2/container/garray"
	"github.com/gogf/gf/v2/container/gtype"
	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/encoding/gjson"
	"github.com/gogf/gf/v2/errors/gcode"
	"github.com/gogf/gf/v2/errors/gerror"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/text/gstr"
	"github.com/gogf/gf/v2/util/gconv"
	"github.com/kennylixi/gadmin/internal/consts"
	commonService "github.com/kennylixi/gadmin/internal/modules/common/service"
	"github.com/kennylixi/gadmin/internal/modules/system/dao"
	"github.com/kennylixi/gadmin/internal/modules/system/model"
	"github.com/kennylixi/gadmin/internal/modules/system/model/do"
	"github.com/kennylixi/gadmin/internal/modules/system/model/entity"
	sysService "github.com/kennylixi/gadmin/internal/modules/system/service"
	"github.com/mozillazg/go-pinyin"
)

const (
	key         = "bd5fe1d30a88fe56e4effecb85e482c2"
	districtUrl = "https://restapi.amap.com/v3/config/district"
)

type sDistrict struct {
}

func init() {
	sysService.RegisterDistrict(New())
}

func New() *sDistrict {
	return &sDistrict{}
}

const (
	citycode  = "citycode"
	adcode    = "adcode"
	name      = "name"
	center    = "center"
	level     = "level"
	districts = "districts"

	levelCountry  = "country"  //国家
	levelProvince = "province" //省
	levelCity     = "city"     //市
	levelDistrict = "district" //区县
	levelStreet   = "street"   // 街道
)

var levels = garray.NewStrArrayFrom([]string{levelProvince, levelCity, levelDistrict, levelStreet})

// Sync 同步
func (s *sDistrict) Sync(ctx context.Context) error {
	// 获取到街道一级
	res, err := g.Client().Get(ctx, districtUrl, map[string]interface{}{"subdistrict": 5, "key": key})
	if err != nil {
		return err
	}
	bodyJson := gjson.New(res.ReadAll())
	info := bodyJson.Get("info").String()
	if info != "OK" {
		return gerror.New(info)
	}
	zdistricts := make([]*entity.District, 0, 1024)
	id := gtype.NewInt(0)
	topId := id.Val()
	createBy := commonService.BizCtx().GetUserName(ctx)
	for _, country := range bodyJson.GetJsons(districts) {
		// 过滤出中华人民共和国
		if country.Get(adcode).String() != "100000" {
			continue
		}

		provinces := country.GetJsons(districts)
		// 省
		for _, province := range provinces {
			provinceVo := &entity.District{
				ParentId: int64(topId),
				Id:       int64(id.Add(1)),
				Name:     province.Get(name).String(),
				Center:   province.Get(center).String(),
				Adcode:   province.Get(adcode).String(),
				Level:    province.Get(level).String(),
				Status:   consts.Normal,
				CreateBy: createBy,
			}
			provinceVo.Pinyin = garray.NewStrArrayFrom(pinyin.LazyConvert(provinceVo.Name, nil)).Join(" ")
			provinceVo.FirstPinyin = gstr.ToUpper(gstr.SubStr(provinceVo.Pinyin, 0, 1))
			provinceVo.Ancestors = fmt.Sprintf("%d", provinceVo.ParentId)
			zdistricts = append(zdistricts, provinceVo)
			// 市
			for _, city := range province.GetJsons(districts) {
				cityVo := &entity.District{
					ParentId: provinceVo.Id,
					Id:       int64(id.Add(1)),
					Name:     city.Get(name).String(),
					Center:   city.Get(center).String(),
					Adcode:   city.Get(adcode).String(),
					Level:    city.Get(level).String(),
					Citycode: city.Get(citycode).String(),
					Status:   consts.Normal,
					CreateBy: createBy,
				}
				cityVo.Pinyin = garray.NewStrArrayFrom(pinyin.LazyConvert(cityVo.Name, nil)).Join(" ")
				cityVo.FirstPinyin = gstr.ToUpper(gstr.SubStr(cityVo.Pinyin, 0, 1))
				cityVo.Ancestors = fmt.Sprintf("%s,%d", provinceVo.Ancestors, provinceVo.Id)
				zdistricts = append(zdistricts, cityVo)
				// 县
				for _, district := range city.GetJsons(districts) {
					districtVo := &entity.District{
						ParentId: cityVo.Id,
						Id:       int64(id.Add(1)),
						Name:     district.Get(name).String(),
						Center:   district.Get(center).String(),
						Adcode:   district.Get(adcode).String(),
						Level:    district.Get(level).String(),
						Citycode: district.Get(citycode).String(),
						Status:   consts.Normal,
						CreateBy: createBy,
					}
					districtVo.Pinyin = garray.NewStrArrayFrom(pinyin.LazyConvert(districtVo.Name, nil)).Join(" ")
					districtVo.FirstPinyin = gstr.ToUpper(gstr.SubStr(districtVo.Pinyin, 0, 1))
					districtVo.Ancestors = fmt.Sprintf("%s,%d", cityVo.Ancestors, cityVo.Id)
					zdistricts = append(zdistricts, districtVo)
					// 街道
					for _, street := range district.GetJsons(districts) {
						streetVo := &entity.District{
							ParentId: districtVo.Id,
							Id:       int64(id.Add(1)),
							Name:     street.Get(name).String(),
							Center:   street.Get(center).String(),
							Adcode:   street.Get(adcode).String(),
							Level:    street.Get(level).String(),
							Citycode: street.Get(citycode).String(),
							Status:   consts.Normal,
							CreateBy: createBy,
						}
						streetVo.Pinyin = garray.NewStrArrayFrom(pinyin.LazyConvert(streetVo.Name, nil)).Join(" ")
						streetVo.FirstPinyin = gstr.ToUpper(gstr.SubStr(streetVo.Pinyin, 0, 1))
						streetVo.Ancestors = fmt.Sprintf("%s,%d", districtVo.Ancestors, districtVo.Id)
						zdistricts = append(zdistricts, streetVo)
					}
				}
			}
		}
	}
	err = dao.District.Transaction(ctx, func(ctx context.Context, tx gdb.TX) error {
		_, err := tx.Exec("truncate table " + dao.District.Table())
		if err != nil {
			return err
		}
		_, err = dao.District.Ctx(ctx).TX(tx).Batch(200).Insert(zdistricts)
		return err
	})
	return err
}

// GetListByParentId 根据上级获取下级列表
func (s *sDistrict) GetListByParentId(ctx context.Context, parentId int64) (districts []*model.District, err error) {
	err = dao.District.Ctx(ctx).Where(&do.District{
		ParentId: parentId,
		Status:   consts.Normal,
	}).OrderAsc(dao.District.Columns().OrderNum).OrderAsc(dao.District.Columns().Adcode).Scan(&districts)
	return
}

// GetAllCitiyList 获取市级，根据首字母归类
func (s *sDistrict) GetAllCitiyList(ctx context.Context) (districts map[string][]*model.ZDistrictItem, err error) {
	districtList := ([]*entity.District)(nil)
	err = dao.District.Ctx(ctx).Where(&do.District{
		Level:  levelCity,
		Status: consts.Normal,
	}).OrderAsc(dao.District.Columns().Pinyin).OrderAsc(dao.District.Columns().OrderNum).Scan(&districtList)

	districts = make(map[string][]*model.ZDistrictItem)
	if err != nil {
		return
	}

	var currPinyin string
	for _, district := range districtList {
		if currPinyin != district.FirstPinyin {
			currPinyin = district.FirstPinyin
			districts[currPinyin] = make([]*model.ZDistrictItem, 0)
		}
		districts[currPinyin] = append(districts[currPinyin], &model.ZDistrictItem{
			Id:   district.Id,
			Name: district.Name,
		})
	}
	return
}

// GetAllCityAndDistrictList 获取市、县两级根据首字母归类
func (s *sDistrict) GetAllCityAndDistrictList(ctx context.Context) (districts map[string][]*model.ZDistrictItem, err error) {
	districtList := ([]*entity.District)(nil)
	err = dao.District.Ctx(ctx).Where(dao.District.Columns().Status, consts.Normal).
		WhereIn(dao.District.Columns().Level, []string{levelCity, levelDistrict}).
		OrderAsc(dao.District.Columns().Pinyin).
		OrderAsc(dao.District.Columns().OrderNum).
		Scan(&districtList)

	districts = make(map[string][]*model.ZDistrictItem)
	if err != nil {
		return
	}

	var currPinyin string
	for _, district := range districtList {
		if currPinyin != district.FirstPinyin {
			currPinyin = district.FirstPinyin
			districts[currPinyin] = make([]*model.ZDistrictItem, 0)
		}
		districts[currPinyin] = append(districts[currPinyin], &model.ZDistrictItem{
			Id:   district.Id,
			Name: district.Name,
		})
	}
	return
}

// GetExclude 获取一条线路的所有上级地区
func (s *sDistrict) GetExclude(ctx context.Context, id int64) (districts []*model.District, err error) {
	district := (*model.District)(nil)
	if id == 0 {
		// 如果是获取id=0节点的时候默认获取parentId=0的所有节点
		err = dao.District.Ctx(ctx).Where(&do.District{ParentId: id}).Scan(&district)
	} else {
		err = dao.District.Ctx(ctx).WherePri(id).Scan(&district)
	}
	if err != nil {
		return
	}
	if district == nil {
		return
	}
	ids := gstr.Split(district.Ancestors, ",")
	var currDistrict *model.District
	idLen := len(ids)
	for i := 0; i < idLen; i++ {
		id := gconv.Int64(ids[i])
		list, err := s.GetListByParentId(ctx, id)
		if err != nil {
			return nil, err
		}
		if districts == nil {
			districts = list
			goto FIND
		}
		if currDistrict.Id == id {
			currDistrict.Children = list
			goto FIND
		}
		continue
	FIND:
		if i < idLen-1 {
			nextId := gconv.Int64(ids[i+1])
			for _, item := range list {
				if item.Id == nextId {
					currDistrict = item
					break
				}
			}
		}
	}
	return
}

// GetById 根据ID获取自定行政区域数据
func (s *sDistrict) GetById(ctx context.Context, id int64) (entity *entity.District, err error) {
	err = dao.District.Ctx(ctx).WherePri(id).Scan(&entity)
	return
}

// GetMaxId 获取最大ID值
func (s *sDistrict) GetMaxId(ctx context.Context) (maxId int64, err error) {
	maxItem := (*entity.District)(nil)
	err = dao.District.Ctx(ctx).OrderDesc(dao.District.Columns().Id).Limit(1).Scan(&maxItem)
	if err != nil {
		return
	}
	maxId = maxItem.Id
	return
}

// Insert 新增
func (s *sDistrict) Insert(ctx context.Context, in *model.DistrictInsertInput) (err error) {
	parent := (*entity.District)(nil)
	err = dao.District.Ctx(ctx).WherePri(in.ParentId).Scan(&parent)
	if err != nil {
		err = gerror.Wrap(err, "上级节点不存在")
		return
	}

	maxId, err := s.GetMaxId(ctx)
	if err != nil {
		err = gerror.Wrap(err, "生成ID错误")
		return
	}

	pinyin := garray.NewStrArrayFrom(pinyin.LazyConvert(in.Name, nil)).Join(" ")
	firstPinyin := gstr.CaseCamel(gstr.SubStr(pinyin, 0, 1))

	levelIndex := levels.Search(parent.Level)
	if levelIndex >= levels.Len() {
		return gerror.Newf("%s下不能增加下级行政区域", parent.Name)
	}

	_, err = dao.District.Ctx(ctx).Insert(&do.District{
		Id:          maxId + 1,
		ParentId:    in.ParentId,
		Ancestors:   fmt.Sprintf("%s,%d", parent.Ancestors, parent.Id),
		Name:        in.Name,
		Center:      in.Center,
		Citycode:    in.Citycode,
		Adcode:      in.Adcode,
		Pinyin:      pinyin,
		FirstPinyin: firstPinyin,
		Level:       levels.At(levelIndex + 1),
		Status:      in.Status,
		OrderNum:    in.OrderNum,
		CreateBy:    in.CreateBy,
	})
	return
}

// Update 修改
func (s *sDistrict) Update(ctx context.Context, in *model.DistrictUpdateInput) (err error) {
	err = dao.District.Transaction(ctx, func(ctx context.Context, tx gdb.TX) error {
		district := (*entity.District)(nil)
		err = dao.District.Ctx(ctx).TX(tx).WherePri(in.Id).Scan(&district)
		if gerror.HasCode(err, gcode.CodeNotFound) {
			return gerror.Wrap(err, "ID对应的行政区不存在")
		}
		if err != nil {
			return err
		}
		ancestors := "0"
		level := district.Level
		if district.ParentId != in.ParentId {
			level = levelProvince
			//	修改为非省级行政区域
			if in.ParentId != 0 {
				newParent := (*entity.District)(nil)
				err = dao.District.Ctx(ctx).TX(tx).WherePri(in.ParentId).Scan(&newParent)
				if err != nil {
					return gerror.Wrap(err, "上级节点不存在")
				}
				levelIndex := levels.Search(newParent.Level)
				if levelIndex >= levels.Len() {
					return gerror.Newf("%s下不能增加下级行政区域", newParent.Name)
				}
				level = levels.At(levelIndex + 1)
				ancestors = fmt.Sprintf("%s,%d", newParent.Ancestors, newParent.Id)
			}
			// 更新所有原始下级的ancestors
			children := ([]*entity.District)(nil)
			err = dao.District.Ctx(ctx).TX(tx).Where("find_in_set(?, ancestors)", in.Id).Scan(&children)
			if err != nil {
				return err
			}

			if children != nil && len(children) > 0 {
				setParams := " case " + dao.District.Columns().Id + " "
				ids := make([]int64, len(children))
				for _, child := range children {
					child.Ancestors = gstr.Replace(child.Ancestors, district.Ancestors, ancestors)
					ids = append(ids, child.Id)
					setParams += fmt.Sprintf(" when %d then %s ", child.Id, child.Ancestors)
				}
				setParams += " end "

				_, err = dao.District.Ctx(ctx).TX(tx).Data(dao.District.Columns().Ancestors, setParams).WherePri(district.Id).Update()
				if err != nil {
					return err
				}
			}
		}

		pinyin := garray.NewStrArrayFrom(pinyin.LazyConvert(in.Name, nil)).Join(" ")
		firstPinyin := gstr.CaseCamel(gstr.SubStr(pinyin, 0, 1))

		// 修改自身数据
		_, err = dao.District.Ctx(ctx).TX(tx).Update(&do.District{
			ParentId:    in.ParentId,
			Ancestors:   ancestors,
			Name:        in.Name,
			Center:      in.Center,
			Citycode:    in.Citycode,
			Adcode:      in.Adcode,
			Pinyin:      pinyin,
			FirstPinyin: firstPinyin,
			Level:       level,
			Status:      in.Status,
			OrderNum:    in.OrderNum,
			UpdateBy:    in.UpdateBy,
		}, &do.District{Id: in.Id})
		return err
	})

	return
}

// Delete 删除自己和所有下级
func (s *sDistrict) Delete(ctx context.Context, id int64) (err error) {
	_, err = dao.District.Ctx(ctx).
		Where("find_in_set(?, ancestors)", id).
		WhereOr(dao.District.Columns().Id, id).
		Delete()
	return
}
