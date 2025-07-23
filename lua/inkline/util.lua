local M = {}

local uv = vim.uv or vim.loop

M.bg = "#000000"
M.fg = "#ffffff"

-- Cache system for performance
M.cache = {}

---@param c  string
local function rgb(c)
  c = string.lower(c)
  return { tonumber(c:sub(2, 3), 16), tonumber(c:sub(4, 5), 16), tonumber(c:sub(6, 7), 16) }
end

---@param foreground string foreground color
---@param background string background color
---@param alpha number|string number between 0 and 1. 0 results in bg, 1 results in fg
function M.blend(foreground, alpha, background)
  alpha = type(alpha) == "string" and (tonumber(alpha, 16) / 0xff) or alpha
  local bg = rgb(background)
  local fg = rgb(foreground)

  local blendChannel = function(i)
    local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
    return math.floor(math.min(math.max(0, ret), 255) + 0.5)
  end

  return string.format("#%02x%02x%02x", blendChannel(1), blendChannel(2), blendChannel(3))
end

function M.blend_bg(hex, amount, bg)
  return M.blend(hex, amount, bg or M.bg)
end

M.darken = M.blend_bg

function M.blend_fg(hex, amount, fg)
  return M.blend(hex, amount, fg or M.fg)
end

M.lighten = M.blend_fg

function M.cache.file(key)
  return vim.fn.stdpath("cache") .. "/inkline-" .. key .. ".json"
end

---@param key string
function M.cache.read(key)
  ---@type boolean, inkline.Cache
  local ok, ret = pcall(function()
    return vim.json.decode(M.read(M.cache.file(key)), { luanil = {
      object = true,
      array = true,
    } })
  end)
  return ok and ret or nil
end

---@param key string
---@param data inkline.Cache
function M.cache.write(key, data)
  pcall(M.write, M.cache.file(key), vim.json.encode(data))
end

function M.cache.clear()
  for _, style in ipairs({ "original", "retro", "cyberpunk" }) do
    uv.fs_unlink(M.cache.file(style))
  end
end

---@param filepath string
function M.read(filepath)
  local file = io.open(filepath, "r")
  if not file then
    return nil
  end
  local content = file:read("*a")
  file:close()
  return content
end

---@param filepath string
---@param content string
function M.write(filepath, content)
  local file = io.open(filepath, "w")
  if not file then
    error("Failed to open file for writing: " .. filepath)
  end
  file:write(content)
  file:close()
end

return M
