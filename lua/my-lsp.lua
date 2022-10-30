local mason = require("mason")
local mason_lsp = require("mason-lspconfig")
local lspconfig = require("lspconfig")
local cmp = require("cmp_nvim_lsp")

mason.setup()
mason_lsp.setup({
  ensure_installed = { "sumneko_lua", "rust_analyzer", "taplo", "cssls", "tsserver" },
})

-- [ autocomplete ]
-- Add additional capabilities supported by nvim-cmp
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = cmp.default_capabilities(capabilities)
local capabilities = cmp.default_capabilities()

-- cmp_nvim_lsp.update_capabilities is deprecated, use cmp_nvim_lsp.default_capabilities instead. See :h deprecated
-- This function will be removed in cmp-nvim-lsp version 1.0.0

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
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

lspconfig["sumneko_lua"].setup({
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

lspconfig["rust_analyzer"].setup({
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)

    vim.keymap.set("n", "<C-space>", require("rust-tools").hover_actions.hover_actions, { buffer = bufnr })
    vim.keymap.set("n", "<Leader>a", require("rust-tools").code_action_group.code_action_group, { buffer = bufnr })
    vim.api.nvim_buf_set_keymap(
      bufnr,
      "n",
      "<localleader>hh",
      "<cmd>lua require('rust-tools.inlay_hints').toggle_inlay_hints()<CR>",
      { noremap = true, silent = true }
    )
  end,
  capabilities = capabilities,
})

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
