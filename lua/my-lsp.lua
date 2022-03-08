local lsp_installer = require("nvim-lsp-installer")
local cmp = require("cmp_nvim_lsp")

-- [ autocomplete ]
-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp.update_capabilities(capabilities)

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
  bufmap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>")
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

-- Config for `sumneko_lua`
local function lua_config()
  return {
    settings = {
      Format = {
        function()
          require("stylua-nvim").format_file()
        end,
      },
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
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)

      vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "<space>f",
        [[<cmd>lua require("stylua-nvim").format_file()<CR>]],
        { noremap = true, silent = true }
      )
    end,
    capabilities = capabilities,
    flags = {
      -- This will be the default in neovim 0.7+
      debounce_text_changes = 150,
    },
  }
end

local function rust_config()
  return {
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)

      vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "<localleader>hh",
        "<cmd>lua require('rust-tools.inlay_hints').toggle_inlay_hints()<CR>",
        { noremap = true, silent = true }
      )
    end,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    },
  }
end

-- Register a handler that will be called for each installed server when the
-- installation is finished or the server is already installed.
lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    },
  }

  if server.name == "sumneko_lua" then
    opts = lua_config()
  elseif server.name == "rust_analyzer" then
    opts = rust_config()
  end

  -- See https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  server:setup(opts)
end)
