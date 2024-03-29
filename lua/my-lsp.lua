local mason = require("mason")
local mason_lsp = require("mason-lspconfig")
local lspconfig = require("lspconfig")
local cmp = require("cmp_nvim_lsp")

mason.setup()
mason_lsp.setup({
  ensure_installed = { "lua_ls", "rust_analyzer", "taplo", "cssls", "tsserver" },
})

-- [ autocomplete ]
local capabilities = cmp.default_capabilities()

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function (_, bufnr)
  local function bufmap(mode, shortcut, command)
    vim.api.nvim_buf_set_keymap(bufnr, mode, shortcut, command, { noremap = true, silent = true })
  end

  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  bufmap("n", "<space>d", "<cmd>lua vim.lsp.buf.definition()<CR>")
  bufmap("n", "<space>f", "<cmd>lua vim.lsp.buf.format({ async = true})<CR>")
  bufmap("n", "<space>h", "<cmd>lua vim.lsp.buf.hover()<CR>")
  bufmap("n", "<space>i", "<cmd>lua vim.lsp.buf.implementation()<CR>")
  bufmap("n", "<space>r", "<cmd>lua vim.lsp.buf.rename()<CR>")
  bufmap("n", "<space>t", "<cmd>lua vim.lsp.buf.type_definition()<CR>")

  -- bufmap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
  bufmap("n", "<space>dd", "<cmd>lua vim.lsp.buf.declaration()<CR>")
  bufmap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
  bufmap("n", "<space>rf", "<cmd>lua vim.lsp.buf.references()<CR>")
  bufmap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>")
  bufmap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")
  bufmap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>")
end

lspconfig["lua_ls"].setup({
  commands = {
    Format = {
      require("stylua-nvim").format_file,
    },
  },
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },
      telemetry = {
        enable = false,
      },
    },
  },
  on_attach = on_attach,
  capabilities = capabilities,
})

-- See: my-rust.lua
-- lspconfig["rust_analyzer"]

lspconfig["taplo"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig["cssls"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig["tsserver"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
})


local M = {
  on_attach = on_attach,
}

return M
