-- ~/.config/nvim/lua/plugins/telescope.lua
return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local telescope = require("telescope")
            local actions = require("telescope.actions")
            local builtin = require("telescope.builtin")

            -- Telescope setup
            telescope.setup({
                defaults = {
                    mappings = {
                        i = {  -- insert mode
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                        },
                        n = {  -- normal mode
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                        },
                    },
                },
            })

            -- Leader key mappings for common pickers
            vim.keymap.set("n", "<leader>ff", function()
                builtin.find_files({
                    hidden = true,
                    no_ignore = true,
                })
            end)
            vim.keymap.set("n", "<leader>fg", builtin.live_grep)
            vim.keymap.set("n", "<leader>fb", builtin.buffers)
            vim.keymap.set("n", "<leader>fh", builtin.help_tags)
        end,
    },
}
