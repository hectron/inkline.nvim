local H = dofile("tests/helpers.lua")
local child = H.new_child()

local T = MiniTest.new_set({
  hooks = {
    pre_case = child.setup,
    post_once = child.stop,
  },
})

local function report(opts_src)
  H.load(child, opts_src)
  child.cmd("checkhealth inkline")
  return table.concat(child.api.nvim_buf_get_lines(0, 0, -1, false), "\n")
end

local function expect_match(text, pattern)
  if not text:find(pattern) then
    error(("health report does not match %q:\n%s"):format(pattern, text), 0)
  end
end

T["reports a valid setup"] = function()
  child.o.termguicolors = true
  local text = report("{}")
  expect_match(text, "OK Options are valid")
  expect_match(text, "OK Active colorscheme: inkline%-original")
  if text:find("WARNING") or text:find("ERROR") then
    error("unexpected warning:\n" .. text, 0)
  end
end

T["warns about unknown options and plugins"] = function()
  local text = report("{ purple_coments = true, plugins = { flsh = false } }")
  expect_match(text, 'WARNING Unknown option "purple_coments"')
  expect_match(text, 'WARNING Unknown plugin "flsh"')
end

T["reports invalid option types"] = function()
  local text = report("{ transparent = 'yes' }")
  expect_match(text, "ERROR transparent: expected boolean")
end

T["notes the deprecated cache option"] = function()
  expect_match(report("{ cache = true }"), "`cache` is deprecated")
end

return T
