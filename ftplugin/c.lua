local vim = vim

vim.opt_local.foldlevel = 0
vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.wo[0][0].foldmethod = 'expr'

vim.opt_local.makeprg = "make"

-- vim.keymap.set("n", "<leader>r", ":split<CR>:terminal ./build/main<CR>");
