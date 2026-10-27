return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "saghen/blink.cmp",
            "mason.nvim",
            "mason-lspconfig.nvim",
        },
        config = function()
            vim.lsp.config("*", {
                capabilities = require("blink.cmp").get_lsp_capabilities(),
            })

            vim.lsp.enable({
                "lua_ls",
                "ts_ls",
                "pyright",
            })

            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup(
                    "UserLspConfig",
                    { clear = true }
                ),
                callback = function(ev)
                    local opts = { buffer = ev.buf, silent = true }

                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
                    vim.keymap.set("n", "[g",
                        function()
                            vim.diagnostic.jump({ count = -1 })
                        end, opts)
                    vim.keymap.set("n", "]g",
                        function()
                            vim.diagnostic.jump({ count = 1 })
                        end, opts)
                end,
            })
        end,
    },
}
