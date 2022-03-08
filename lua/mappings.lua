local map = vim.api.nvim_set_keymap

local function silent_map(mode, shortcut, command)
  map(mode, shortcut, command, { noremap = true, silent = true })
end

local function fast_map(mode, shortcut, command)
  map(mode, shortcut, command, { noremap = true, silent = true, nowait = true })
end


-- [ contextual ] {{{
silent_map("i", "jk", "<esc>")
map("n", "<space><space>", ":", { noremap = true, nowait = true })
map("n", "q<space>", "q:", { noremap = true, nowait = true })
map("n", "<leader>l", ":lua ", { noremap = true })

-- clear trailing whitespace
local clean_trailing_ws = [[:let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:retab<cr>]]
fast_map("n", "<F5>", clean_trailing_ws)
fast_map("n", "<localleader>w", clean_trailing_ws)

fast_map("i", "<F1>", "<esc>")
fast_map("v", "<F1>", "<esc>")
fast_map("n", "<F1>", "<cmd>map<cr>")

--  system yank/paste interaction
fast_map("v", "<leader>y", [["+y]])
fast_map("v", "<leader>d", [["+d]])
fast_map("n", "<leader>p", [["+p]])
fast_map("n", "<leader>P", [["+P]])
fast_map("v", "<leader>p", [["+p]])
fast_map("v", "<leader>P", [["+P]])

-- command-line-mode navigation
--
-- TODO: not working. Use `q:` instead
-- map("c", "<C-a", "<Home>", { noremap = true, nowait = true })
-- map("c", "<C-e", "<End>", { noremap = true, nowait = true })
-- map("c", "<C-l", "<S-Right>", { noremap = true, nowait = true })
-- map("c", "<C-h", "<S-Left>", { noremap = true, nowait = true })
map("c", "<C-k>", "<Up>", { noremap = true , nowait = true })
map("c", "<C-j>", "<Down>", { noremap = true , nowait = true })

-- buffer navigation
fast_map("n", "<S-l>", ":bnext<cr>")
fast_map("n", "<S-h>", ":bprevious<cr>")

-- clear highlights
fast_map('n', '<C-l>', '<cmd>noh<CR>')

-- very magic regex
map("", "/", [[/\v]], { noremap = true })
map("", "?", [[?\v]], { noremap = true })

-- keep visual mode afer indentating
silent_map("v", "<", "<gv")
silent_map("v", ">", ">gv")

-- move lines up and down
map("n", "<A-j>", ":m .+1<CR>==", { noremap = true})
map("n", "<A-k>", ":m .-2<CR>==", { noremap = true})
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { noremap = true})
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { noremap = true})
map("v", "<A-j>", ":m \'>+1<CR>gv=gv", { noremap = true})
map("v", "<A-k>", ":m \'<-2<CR>gv=gv", { noremap = true})

-- }}}

-- [ lsp ] {{{
fast_map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
fast_map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
fast_map('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>')
fast_map('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>')

-- XXX: See `my-lsp.lua:55` for more buffer-based mappings.

-- }}}

-- [ telescope ] {{{
fast_map("n", "<localleader>f", "<cmd>Telescope find_files<cr>")
fast_map("n", "<localleader>b", "<cmd>Telescope buffers<cr>")
fast_map("n", "<localleader>s", "<cmd>Telescope live_grep<cr>")
silent_map("n", "<localleader>h", "<cmd>Telescope help_tags<cr>")
fast_map("n", "<localleader>t", "<cmd>Telescope<cr>")
-- }}}

-- [ easyalign ] {{{
map("v", "<Enter>", "<Plug>(EasyAlign)", {})
-- }}}

-- [ undotree ] {{{
map("n", "<localleader>u", "<cmd>UndotreeToggle<cr>", {})
-- }}}
