-- config for rust-tools.nvim
local g = vim.g


local opts = {
    tools = {
        -- Automatically set inlay hints (type hints)
        autoSetHints = true,

        -- These apply to the default RustSetInlayHints command
        inlay_hints = {

            -- Only show inlay hints for the current line
            only_current_line = false,

            -- Event which triggers a refersh of the inlay hints.
            -- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
            -- not that this may cause  higher CPU usage.
            -- This option is only respected when only_current_line and
            -- autoSetHints both are true.
            only_current_line_autocmd = "CursorHold",

            -- wheter to show parameter hints with the inlay hints or not
            show_parameter_hints = true,

            -- whether to show variable name before type hints with the inlay hints or not
            show_variable_name = false,

            -- prefix for parameter hints
            parameter_hints_prefix = "<- ",

            -- prefix for all the other hints (type, chaining)
            other_hints_prefix = "=> ",

            -- whether to align to the length of the longest line in the file
            max_len_align = false,

            -- padding from the left if max_len_align is true
            max_len_align_padding = 1,

            -- whether to align to the extreme right or not
            right_align = false,

            -- padding from the right if right_align is true
            right_align_padding = 7,

            -- The color of the hints
            highlight = "Comment",
        },

        hover_actions = {
            -- the border that is used for the hover window
            -- see vim.api.nvim_open_win()
            border = {
                {"╭", "FloatBorder"}, {"─", "FloatBorder"},
                {"╮", "FloatBorder"}, {"│", "FloatBorder"},
                {"╯", "FloatBorder"}, {"─", "FloatBorder"},
                {"╰", "FloatBorder"}, {"│", "FloatBorder"}
            },

            -- whether the hover action window gets automatically focused
            auto_focus = false
        },
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
    server = {
        -- standalone file support
        -- setting it to false may improve startup time
        standalone = true,
        on_attach = require("my-lsp").on_attach,
    }, -- rust-analyer options

    -- debugging stuff
    dap = {
        adapter = {
            type = 'executable',
            command = 'lldb-vscode',
            name = "rt_lldb"
        }
    }
}

require("rust-tools").setup(opts)


g.rust_conceal = 1
g.rust_conceal_mod_path = 1
g.rust_conceal_pub = 1
g.rust_fold = 1
-- g.rustfmt_command = "rustfmt"
g.rustfmt_fail_silently = 0

-- TODO:
-- autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 200)
