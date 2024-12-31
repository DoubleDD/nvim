local M = {}

-- 缓存表
M.cache = {}

-- 设置缓存
function M.set(key, value)
  M.cache[key] = value
end

-- 获取缓存
function M.get(key)
  return M.cache[key]
end

return M
