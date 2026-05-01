local vim = vim

vim.opt_local.foldlevel = 1
vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.wo[0][0].foldmethod = 'expr'
vim.opt_local.foldnestmax = 2

vim.opt_local.makeprg = "make"

-- vim.keymap.set("n", "<leader>r", ":split<CR>:terminal java -ea */%:r<CR>");
-- vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>lf", "zzmagg=G'azz")
