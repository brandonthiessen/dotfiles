vim.lsp.config("clangd", {
    cmd = {
        "clangd",
        "--header-insertion=never",
    },
})

return {
    {
        "saghen/blink.cmp",
        version = "1.*",
        opts = {
            keymap = {
                preset = "none",

                ["<C-j>"] = { "select_next" },
                ["<C-k>"] = { "select_prev" },
                ["<C-Space>"] = { "show" },
                ["<Tab>"] = { "accept", "fallback" },
            },

            sources = {
                default = { "lsp" },
            },

            completion = {
                list = {
                    selection = {
                        preselect = true,
                        auto_insert = false,
                    },
                },
                documentation = {
                    auto_show = false,
                },
            },
        },
    },
}
