local vim = vim

vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.shiftround = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.linebreak = true
vim.opt.wrap = false
vim.opt.textwidth = 72
-- vim.opt.formatoptions = "tcqj"

vim.opt.list = true
vim.opt.listchars = "trail:*,extends:<,tab:**"

vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = false

vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = "fuzzy"
vim.opt.guicursor = "a:block-cusor-blinkwait0-blinkon400-blinkoff250"
vim.opt.cursorline = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.winborder = "rounded"

vim.opt.iskeyword:remove { "_" }

vim.diagnostic.config {
  update_in_insert = true,
  virtual_text = true,
}

vim.filetype.add {
  extension = { h = 'c' }
}

--[[
vim.g.netrw_banner = 0
vim.g.netrw_sizestyle = "h"
]]
