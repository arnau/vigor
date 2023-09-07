local paq = require("paq")

local HOME = os.getenv("HOME")

vim.g.mapleader = "\\"
vim.g.maplocalleader = ","

-- Plugins
paq({
  -- paq
  "savq/paq-nvim",

  -- [ lsp ] {{{
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  "mfussenegger/nvim-dap", -- debugger
  "mhartington/formatter.nvim", -- formatter
  -- }}}

  -- [ autocomplete ] {{{
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-path",
  "hrsh7th/nvim-cmp",

  -- Snippets
  -- "hrsh7th/cmp-vsnip",
  -- "hrsh7th/vim-vsnip",
  -- }}}

  -- fuzzy search
  "nvim-lua/plenary.nvim",
  "nvim-lua/popup.nvim",
  "nvim-telescope/telescope.nvim", -- depends on plenary

  -- telescope
  -- "nvim-telescope/telescope-symbols.nvim",
  "nvim-telescope/telescope-ui-select.nvim",
  "nvim-telescope/telescope-media-files.nvim",

  -- "RishabhRD/popfix",
  -- "hood/popui.nvim", -- requires popfix

  "nvim-treesitter/nvim-treesitter",

  -- statusline
  "nvim-lualine/lualine.nvim",

  -- [ helpers ] {{{
  "numToStr/Comment.nvim",
  "tpope/vim-repeat",
  "tpope/vim-surround", -- requires vim-repeat
  "junegunn/vim-easy-align",
  "windwp/nvim-autopairs",
  "lewis6991/gitsigns.nvim", -- requires plenary
  "AckslD/nvim-neoclip.lua", -- requires telescope
  "gpanders/editorconfig.nvim",
  "chentoast/marks.nvim",
  "sindrets/diffview.nvim",
  "drybalka/tree-climber.nvim", -- requires treesitter
  -- }}}

  -- syntaxes {{{
  "preservim/vim-markdown",
  "norcalli/nvim-colorizer.lua",
  "pest-parser/pest.vim",
  "NoahTheDuke/vim-just",
  -- }}}

  -- lua {{{
  "ckipp01/stylua-nvim", -- required by lua lsp
  -- }}}

  -- rust {{{
  "simrat39/rust-tools.nvim", -- requires telescope-ui-select, popui, lsp
  -- }}}

  -- themes
  "junegunn/seoul256.vim",
  "rktjmp/lush.nvim",
  "arnau/teaspoon.nvim",
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

-- TODO: https://github.com/LunarVim/Neovim-from-scratch/blob/09-autopairs/lua/user/autopairs.lua
require("nvim-autopairs").setup()

require("neoclip").setup()

require("comment").setup()

require("colorizer").setup()

require("marks").setup({})

-- vim-markdown
vim.g.vim_markdown_folding_disabled = true
-- vim.g.vim_markdown_folding_level = 6

-- markdown-composer
vim.g.markdown_composer_open_browser = false

-- tree-climber
local climber = require("tree-climber")
local keyopts = { noremap = true, silent = true }
vim.keymap.set({ "n", "v", "o" }, "<c-o>", climber.goto_parent, keyopts)
vim.keymap.set({ "n", "v", "o" }, "<c-i>", climber.goto_child, keyopts)
vim.keymap.set({ "n", "v", "o" }, "<c-n>", climber.goto_next, keyopts)
vim.keymap.set({ "n", "v", "o" }, "<c-p>", climber.goto_prev, keyopts)
vim.keymap.set({ "v", "o" }, "<c-s>", climber.select_node, keyopts)

-- }}}
--
--
-- minimap
-- vim.g.minimap_width = 10
-- vim.g.minimap_auto_start = 1
-- vim.g.minimap_auto_win_enter = 1

-- spectre
vim.keymap.set("n", "<leader>S", '<cmd>lua require("spectre").open()<CR>', {
  desc = "Open Spectre",
})
vim.keymap.set("n", "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
  desc = "Search current word",
})
vim.keymap.set("v", "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
  desc = "Search current word",
})
vim.keymap.set("n", "<leader>sp", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
  desc = "Search on current file",
})
