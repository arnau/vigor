local paq = require("paq")

local HOME = os.getenv("HOME")

vim.g.mapleader = "\\"
vim.g.maplocalleader = ","

-- Plugins
paq({
  -- paq
  "savq/paq-nvim",

  -- [ lsp ] {{{
  "neovim/nvim-lspconfig",
  "williamboman/nvim-lsp-installer",
  "mfussenegger/nvim-dap",
  -- }}}

  -- [ autocomplete ] {{{
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-path",
  "hrsh7th/nvim-cmp",

  -- Snippets
  "saadparwaiz1/cmp_luasnip",
  "L3MON4D3/LuaSnip",
  "rafamadriz/friendly-snippets",

  -- OR

  -- "hrsh7th/cmp-vsnip";
  -- "hrsh7th/vim-vsnip";
  -- }}}

  -- fuzzy search
  "nvim-lua/plenary.nvim",
  "nvim-lua/popup.nvim",
  "nvim-telescope/telescope.nvim", -- depends on plenary

  -- telescope
  "nvim-telescope/telescope-symbols.nvim",
  "crispgm/telescope-heading.nvim",
  "tami5/sqlite.lua",
  "nvim-telescope/telescope-frecency.nvim", -- depends on sqlite.lua
  "sudormrfbin/cheatsheet.nvim", -- depends on plenary and popup
  "nvim-telescope/telescope-ui-select.nvim",

  "RishabhRD/popfix",
  "hood/popui.nvim", -- requires popfix

  "nvim-treesitter/nvim-treesitter",

  -- statusline
  "nvim-lualine/lualine.nvim",

  -- [ helpers ] {{{
  "numToStr/Comment.nvim",
  "tpope/vim-surround",
  "tpope/vim-repeat",
  "junegunn/vim-easy-align",
  "windwp/nvim-autopairs",
  "DanilaMihailov/beacon.nvim",
  "lewis6991/gitsigns.nvim", -- requires plenary
  "mbbill/undotree",
  "AckslD/nvim-neoclip.lua",
  "gpanders/editorconfig.nvim",
  "easymotion/vim-easymotion",
  "sunjon/shade.nvim",
  "folke/zen-mode.nvim",
  -- }}}

  -- syntaxes {{{
  "preservim/vim-markdown",
  "norcalli/nvim-colorizer.lua",
  "pest-parser/pest.vim",
  -- }}}

  -- markdown {{{
  { "euclio/vim-markdown-composer", run = "cargo build --release --locked" },
  -- }}}

  -- lua {{{
  "ckipp01/stylua-nvim",
  -- }}}

  -- rust {{{
  "simrat39/rust-tools.nvim", -- requires telescope-ui-select, popui, lsp
  -- }}}

  -- themes
  "junegunn/seoul256.vim",
  "marko-cerovac/material.nvim";
  "themercorp/themer.lua";
})


-- [ sections ]
require("baseline")
require("mappings")
require("my-lsp")
require("my-cmp")
require("my-telescope")
require("my-treesitter")
require("my-lualine")
require("my-gitsigns")
require("my-rust")


-- [ plugins setup ] {{{

vim.ui.select = require("popui.ui-overrider")

-- TODO: https://github.com/LunarVim/Neovim-from-scratch/blob/09-autopairs/lua/user/autopairs.lua
require("nvim-autopairs").setup()

require("neoclip").setup()

require("comment").setup()

require("colorizer").setup()

require("shade").setup({
  overlay_opacity = 60,
  opacity_step = 1,
  keys = {
    brightness_up = "<M-Up>",
    brightness_down = "<M-Down>",
    toggle = "<leader>s",
  },
})

-- TODO: Not working
require("zen-mode").setup()

-- }}}
