local vim = vim

vim.opt_local.foldlevel = 0
vim.opt_local.foldmethod = "indent"
vim.opt_local.foldnestmax = 1

vim.opt_local.makeprg = "make"

vim.keymap.set("n", "<leader>r", ":split<CR>:terminal ./build/main<CR>");
