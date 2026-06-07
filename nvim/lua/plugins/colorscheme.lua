-- ~/.config/nvim/lua/plugins/colorscheme.lua
return {
    -- Tokyo Night
    {
        "folke/tokyonight.nvim",
        name = "tokyonight",
        lazy = false,
        priority = 1000,
    },

    -- Catppuccin
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
        config = function()
        require("catppuccin").setup({
            transparent_background = true,
        })
        vim.cmd("colorscheme catppuccin-mocha")
        end,
    },

    -- Dracula
    {
        "mofiqul/dracula.nvim",
        name = "dracula",
        lazy = false,
        priority = 1000,
    }
}
