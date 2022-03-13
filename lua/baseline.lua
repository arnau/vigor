-- Baseline configuration

-- local g = vim.g
local opt = vim.opt
local cmd = vim.api.nvim_command

-- [[ colours and fonts ]] {{{
opt.termguicolors = true

-- g.seoul256_background = 234
-- cmd("colorscheme seoul256")

cmd("colorscheme teaspoon")

-- cmd("colorscheme themer_everforest")

-- require("material").setup()
-- cmd("colorscheme material")
-- g.material_style = "deep blue"

-- }}}

-- [[ context ]] {{{
opt.number = true
opt.relativenumber = false
opt.cursorline = true
opt.colorcolumn = "80"
opt.scrolloff = 1
opt.errorbells = false
opt.visualbell = false
opt.signcolumn = "yes"
opt.autoindent = true
opt.smartindent = true
opt.mouse = "a"
opt.pumheight = 10

opt.conceallevel = 2
-- opt.concealcursor = ''

-- TODO: review with nvim 0.7
cmd("au TextYankPost * silent! lua vim.highlight.on_yank {on_visual = false}")
-- }}}

-- [[ undo ]] {{{
opt.undofile = true
-- }}}

-- [[ encoding ]] {{{
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
-- }}}

-- [[ theme ]] {{{
opt.syntax = "ON"
-- }}}

-- [[ whitespace ]] {{{
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.softtabstop = 2
opt.list = true
opt.listchars = { tab = "→ ", trail = "¬" }
opt.showbreak = "···"
-- }}}

-- [[ search ]] {{{
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true
-- }}}

-- [[ splits ]] {{{
opt.splitright = true
opt.splitbelow = true
-- }}}
