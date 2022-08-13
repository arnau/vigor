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
  "sudormrfbin/cheatsheet.nvim", -- depends on plenary and popup
  "nvim-telescope/telescope-ui-select.nvim",

  "RishabhRD/popfix",
  "hood/popui.nvim", -- requires popfix

  "nvim-treesitter/nvim-treesitter",

  -- statusline
  "nvim-lualine/lualine.nvim",

  -- [ helpers ] {{{
  "numToStr/Comment.nvim",
  "tpope/vim-repeat",
  "tpope/vim-surround", -- requires vim-repeat
  "junegunn/vim-easy-align",
  "windwp/nvim-autopairs",
  "DanilaMihailov/beacon.nvim",
  "lewis6991/gitsigns.nvim", -- requires plenary
  "mbbill/undotree",
  "AckslD/nvim-neoclip.lua",
  "gpanders/editorconfig.nvim",
  "easymotion/vim-easymotion",
  -- "sunjon/shade.nvim",
  "folke/zen-mode.nvim",
  "chentoast/marks.nvim",
  "sindrets/diffview.nvim",
  "drybalka/tree-climber.nvim",
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

  -- clojure (lisp) {{{
  "Olical/conjure",
  -- }}}

  -- themes
  "junegunn/seoul256.vim",
  "marko-cerovac/material.nvim",
  -- "themercorp/themer.lua";
  "rktjmp/lush.nvim",
  "arnau/teaspoon.nvim",
  "savq/melange",
})

-- XXX: Debug colorscheme
-- vim.opt.runtimepath:append("~/kitchen/teaspoon.nvim")

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
require("my-diffview")

-- [ plugins setup ] {{{

vim.ui.select = require("popui.ui-overrider")

-- TODO: https://github.com/LunarVim/Neovim-from-scratch/blob/09-autopairs/lua/user/autopairs.lua
require("nvim-autopairs").setup()

require("neoclip").setup()

require("comment").setup()

require("colorizer").setup()

-- require("shade").setup({
--   overlay_opacity = 60,
--   opacity_step = 1,
--   keys = {
--     brightness_up = "<M-Up>",
--     brightness_down = "<M-Down>",
--     toggle = "<leader>s",
--   },
-- })

-- TODO: Not working
require("zen-mode").setup()

require("marks").setup({})

-- vim-markdown
vim.g.vim_markdown_folding_disabled = true
-- vim.g.vim_markdown_folding_level = 6

-- markdown-composer
vim.g.markdown_composer_open_browser = false

-- tree-climber
local climber = require("tree-climber")
local keyopts = { noremap = true, silent = true }
vim.keymap.set({'n', 'v', 'o'}, '<leader>h', climber.goto_parent, keyopts)
vim.keymap.set({'n', 'v', 'o'}, '<leader>l', climber.goto_child, keyopts)
vim.keymap.set({'n', 'v', 'o'}, '<leader>j', climber.goto_next, keyopts)
vim.keymap.set({'n', 'v', 'o'}, '<leader>k', climber.goto_prev, keyopts)
vim.keymap.set({'v', 'o'}, 'in', climber.select_node, keyopts)
vim.keymap.set('n', '<c-k>', climber.swap_prev, keyopts)
vim.keymap.set('n', '<c-j>', climber.swap_next, keyopts)

-- }}}
