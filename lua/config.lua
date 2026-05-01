local vim = vim
local MiniSnippets = MiniSnippets

--[[ plugin declerations ]]--
vim.pack.add {
  'https://github.com/folke/tokyonight.nvim',

  { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' },
  'https://github.com/mason-org/mason.nvim',
  'https://github.com/neovim/nvim-lspconfig',

  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/nvim-telescope/telescope.nvim',
  'https://github.com/stevearc/oil.nvim',

  { src = 'https://github.com/nvim-mini/mini.snippets', version = 'stable' },

  'https://github.com/chomosuke/typst-preview.nvim'
}

--[[ plugin configs ]]--
require('nvim-treesitter').install { 'c', 'cpp', 'java', 'lua', 'typst' }
vim.api.nvim_create_autocmd('FileType', {
  pattern = { '<filetype>' },
  callback = function() vim.treesitter.start() end,
})

require('mason').setup()
require('mason-registry').update() -- auto-update lsp on

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = false
vim.lsp.config( "*", {
  capabilities = capabilities,
})
vim.lsp.enable { 'clangd', 'jdtls', 'lua_ls', 'tinymist' }

require('typst-preview').setup()

require('telescope').setup {
  pickers = {
    find_files = {
      hidden = true
    }
  }
}

require('oil').setup {
  view_options = {
    show_hidden = true,
    sort = {
      { 'type', 'asc' },
      { 'name', 'asc' },
    },
  },
}

local gen_loader = require('mini.snippets').gen_loader
require('mini.snippets').setup {
  snippets = {
    gen_loader.from_file('$XDG_CONFIG_HOME/nvim/snippets/all.json'),
    gen_loader.from_lang(),
  },
  mappings = {
    expand = '<C-s>',
    jump_next = '<C-j>',
    jump_prev = '<C-k>',
    stop = '<C-s>'
  }
}

require('typst-preview').setup {}

require('tokyonight').setup{
  on_colors = function(color)
    color.bg_highlight = '#15161e'
  end,
  on_highlights = function(hl, c)
    hl.CursorLineSign = {
      bg = c.bg_highlight
    }
    hl.CursorLineNr = {
      fg = c.orange,
      bg = c.bg_highlight,
      bold = true
    }
  end
}

vim.cmd.colorscheme('tokyonight-night')

--[[ auto commands ]]--
vim.api.nvim_create_autocmd('PackChanged', { callback = function(event)
  local name = event.data.spec.name
  local kind =  event.data.kind

  if name == 'nvim-treesitter' and kind == 'update' then
    if not event.data.active then vim.cmd.packadd('nvim-treesitter') end
    vim.cmd('TSUpdate')
  end
end })

vim.api.nvim_create_autocmd('PackChanged', { callback = function(event)
  local name = event.data.spec.name
  local kind =  event.data.kind

  if name == 'typst-preview' and kind == 'update' then
    if not event.data.active then vim.cmd.packadd('typst-preview') end
    vim.cmd('TypstPreviewUpdate')
  end
end })

local make_stop = function()
  local au_opts = { pattern = '*:n', once = true }
  au_opts.callback = function()
    while MiniSnippets.session.get() do
      MiniSnippets.session.stop()
    end
  end
  vim.api.nvim_create_autocmd('ModeChanged', au_opts)
end
local opts = { pattern = 'MiniSnippetsSessionStart', callback = make_stop }
vim.api.nvim_create_autocmd('User', opts)

require('keymaps')
require('options')
