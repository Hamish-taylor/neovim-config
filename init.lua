local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correctrequire
require('lazy').setup('plugins')
require('scripts')
local rustaceanvim = require("rustaceanvim")

rustaceanvim.setup({
  dap = {
    adapter = {
      type = "executable",
      command = "/path/to/codelldb",
      name = "rt_lldb",
    },
    configurations = {
      {
        name = "Rust",
        type = "rt_lldb",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
        runInTerminal = false,
      },
    },
  },
})
