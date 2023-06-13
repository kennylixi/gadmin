package redislock

import (
	"context"
	"github.com/gogf/gf/v2/database/gredis"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/util/grand"
	"math/rand"
	"strconv"
	"sync/atomic"
	"time"
)

const (
	randomLen       = 16
	tolerance       = 500 // milliseconds
	millisPerSecond = 1000
)

var (
	lockScript = `if redis.call("GET", KEYS[1]) == ARGV[1] then
    redis.call("SET", KEYS[1], ARGV[1], "PX", ARGV[2])
    return "OK"
else
    return redis.call("SET", KEYS[1], ARGV[1], "NX", "PX", ARGV[2])
end`
	delScript = `if redis.call("GET", KEYS[1]) == ARGV[1] then
    return redis.call("DEL", KEYS[1])
else
    return 0
end`
)

// A RedisLock is a redis lock.
type RedisLock struct {
	store   *gredis.Redis
	seconds uint32
	key     string
	id      string
}

func init() {
	rand.Seed(time.Now().UnixNano())
}

// NewRedisLock returns a RedisLock.
func NewRedisLock(store *gredis.Redis, key string) *RedisLock {
	return &RedisLock{
		store: store,
		key:   key,
		id:    grand.S(randomLen),
	}
}

// Acquire acquires the lock.
func (rl *RedisLock) Acquire() (bool, error) {
	return rl.AcquireCtx(context.Background())
}

// AcquireCtx acquires the lock with the given ctx.
func (rl *RedisLock) AcquireCtx(ctx context.Context) (bool, error) {
	seconds := atomic.LoadUint32(&rl.seconds)
	resp, err := rl.store.Eval(ctx, lockScript, 1, []string{rl.key}, []interface{}{
		rl.id, strconv.Itoa(int(seconds)*millisPerSecond + tolerance),
	})
	if err != nil {
		g.Log().Errorf(ctx, "Error on acquiring lock for %s, %s", rl.key, err.Error())
		return false, err
	} else if resp.IsNil() {
		return false, nil
	}

	if resp.String() == "OK" {
		return true, nil
	}

	g.Log().Errorf(ctx, "Unknown reply when acquiring lock for %s: %v", rl.key, resp)
	return false, nil
}

// Release releases the lock.
func (rl *RedisLock) Release() (bool, error) {
	return rl.ReleaseCtx(context.Background())
}

// ReleaseCtx releases the lock with the given ctx.
func (rl *RedisLock) ReleaseCtx(ctx context.Context) (bool, error) {
	resp, err := rl.store.Eval(ctx, delScript, 1, []string{rl.key}, []interface{}{rl.id})
	if err != nil {
		return false, err
	}

	return resp.Int64() == 1, nil
}

// SetExpire sets the expiration.
func (rl *RedisLock) SetExpire(seconds int) {
	atomic.StoreUint32(&rl.seconds, uint32(seconds))
}
