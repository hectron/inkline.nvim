vim.opt.rtp:prepend(vim.fn.getcwd())
vim.o.swapfile = false

if #vim.api.nvim_list_uis() == 0 then
  vim.opt.rtp:append(vim.fn.getcwd() .. "/.tests/deps/mini.nvim")
  require("mini.test").setup()
end
