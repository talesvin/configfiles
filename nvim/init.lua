vim.opt.ai = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4 
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ruler = true
vim.opt.scrolloff = 6
vim.opt.laststatus = 2
vim.opt.signcolumn = 'yes'
vim.opt.encoding = 'UTF-8'

require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    -- lsp
    use {
        "neovim/nvim-lspconfig",
        "williamboman/nvim-lsp-installer",
    }
    
    -- coq
    use 'ms-jpq/coq_nvim'
    use 'ms-jpq/coq.artifacts'
    use 'ms-jpq/coq.thirdparty'
    
    -- treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ":TSUpdate",
    }
    
    -- theme
    use {'sainnhe/gruvbox-material'}
    
    -- LuaLine
    use 'kyazdani42/nvim-web-devicons'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    
    -- telescope stuff
    --[[ 
    use 'nvim-lua/popup.nviec'
    use 'nvim-lua/plenary.nvim'
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    --]] 

    -- fzf <3 lua
    use {
        'ibhagwan/fzf-lua',
        requires = { 'kyazdani42/nvim-web-devicons' }
    }

end)

-- Theme config
-- vim.opt.background = 'dark'
vim.opt.termguicolors = true
vim.g.gruvbox_material_background = 'hard'
vim.g.gruvbox_material_foreground = 'mix'
vim.cmd[[colorscheme gruvbox-material]]

-- keymaps
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true}
-- open 2 brackets when creating 1 bracket
keymap('i', '{', '{}<Esc>i', {})
-- open fzf
keymap('n', '<C-f>',"<cmd>FzfLua files<CR>", opts)
-- format text
keymap('n', '<C-p>','gg=G<CR>', opts)
-- not using rn
--keymap('n', '<C-p>', '<cmd>Telescope find_files<cr>', opts)

-- LSP Stuff
local lsp = require "lspconfig"
local coq = require "coq"
vim.cmd('COQnow -s')
require('lspconfig')['clangd'].setup{}

-- treesitter
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

-- LuaLine
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
