local vim = vim

vim.g.mapleader = " "

vim.keymap.set("n", "<leader>m", ":w<CR>:make<CR>")
vim.keymap.set("n", "<leader>e", ":Oil<CR>")

-- diagnostics --
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open diagnostic float' })

-- jumping --
vim.keymap.set("n", "<C-u>", "8kzz")
vim.keymap.set("n", "<C-d>", "8jzz")

vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

-- formatting --
vim.keymap.set("n", "<leader>gq", "zzmagqip'azz")
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action)

-- telescope --
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files)
vim.keymap.set("n", "<leader>fg", builtin.live_grep)
vim.keymap.set("n", "<leader>fb", builtin.buffers)
vim.keymap.set('n', "<leader>fh", builtin.help_tags)
