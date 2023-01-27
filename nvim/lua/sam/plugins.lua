--[[plugins.lua]]

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use { "danilamihailov/beacon.nvim" }
  use { "folke/persistence.nvim" }

  use { "alphatechnolog/pywal.nvim", as = "pywal" }
  use { "dylanaraps/wal.vim" }
  use { "RRethy/nvim-base16" }

  use { 'glepnir/dashboard-nvim' }

  use { 'rmagatti/auto-session', }
  use {
    'rmagatti/session-lens',
    requires = { 'rmagatti/auto-session', 'nvim-telescope/telescope.nvim' },
  }

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  use { "nvim-lualine/lualine.nvim" }
  use { "numToStr/Comment.nvim" }
  use { "folke/which-key.nvim" }
  use {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup {}
    end
  }
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use { 'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons' }
  use { "akinsho/toggleterm.nvim", tag = '*' }
  use {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup {
        window = {
          width = .85
        }
      }
    end
  }

  -- lsp
  use {
    "neovim/nvim-lspconfig",
    "williamboman/mason-lspconfig.nvim",
    "williamboman/mason.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "l3mon4d3/luasnip",
    "saadparwaiz1/cmp_luasnip",
    "glepnir/lspsaga.nvim",
  }
  -- treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }
end)
