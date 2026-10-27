return {
    {
        "mason-org/mason.nvim",
        opts = {},
    },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {
                "clangd",       -- C / C++
                "pyright",      -- Python
                "html",         -- HTML
                "cssls",        -- CSS
                "jsonls",       -- JSON
                "bashls",       -- Bash
                "lua_ls",       -- Lua
                "neocmake",     -- CMake
                "yamlls",       -- YAML
                "rust_analyzer", -- Rust
            }
        },
        dependencies = {
            "neovim/nvim-lspconfig",
        },
    },
}
