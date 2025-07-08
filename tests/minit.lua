#!/usr/bin/env -S nvim -l

vim.env.LAZY_STDPATH = ".tests"
load(vim.fn.system("curl -s https://raw.githubusercontent.com/folke/lazy.nvim/main/bootstrap.lua"))()

-- Setup lazy
require("lazy.minit").setup({
  spec = {
    {
      dir = vim.uv.cwd(),
      opts = {},
    },
  },
})

-- Simple test framework
local failed_tests = 0
local total_tests = 0

function describe(name, fn)
  fn()
end

function it(name, fn)
  total_tests = total_tests + 1
  local success, err = pcall(fn)
  if not success then
    failed_tests = failed_tests + 1
    print("FAIL: " .. name .. " - " .. tostring(err))
  end
end

function before_each(fn)
  -- Store for potential future use
end

-- Load test files
dofile("tests/colorscheme_spec.lua")
dofile("tests/colors_spec.lua")

-- Exit with status
if failed_tests > 0 then
  print(failed_tests .. " of " .. total_tests .. " tests failed")
  vim.cmd("cquit 1")
else
  vim.cmd("cquit 0")
end