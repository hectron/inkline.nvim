-- Exact highlight snapshots per style. Run `make snapshots` to accept intended changes.
local H = dofile("tests/helpers.lua")
local child = H.new_child()

local T = MiniTest.new_set({
  hooks = {
    pre_case = child.setup,
    post_once = child.stop,
  },
})

local cases = {
  original = "{ style = 'original' }",
  retro = "{ style = 'retro' }",
  cyberpunk = "{ style = 'cyberpunk' }",
}

for name, opts in pairs(cases) do
  T[name] = function()
    H.load(child, opts)
    H.expect_snapshot(H.dump_highlights(child), name)
  end
end

return T
