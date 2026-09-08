-- ~/.config/nvim/lua/plugins/telescope.lua
return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local telescope = require("telescope")
            local actions = require("telescope.actions")
            local action_state = require("telescope.actions.state")
            local builtin = require("telescope.builtin")

            -- Custom action to open all selected files
            local function open_all_selected(prompt_bufnr)
                local picker = action_state.get_current_picker(prompt_bufnr)
                local multi_selection = picker:get_multi_selection()

                actions.close(prompt_bufnr)

                -- If there are multi-selected files, open all of them
                if #multi_selection > 0 then
                    for _, entry in ipairs(multi_selection) do
                        vim.cmd("edit " .. entry.path or entry.value)
                    end
                else
                    -- If no multi-selection, fall back to opening the current selection
                    local current_entry = action_state.get_selected_entry()
                    if current_entry then
                        vim.cmd("edit " .. current_entry.path or current_entry.value)
                    end
                end
            end

            -- Telescope setup
            telescope.setup({
                defaults = {
                    mappings = {
                        i = {  -- insert mode
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<CR>"] = open_all_selected,  -- Override default enter behavior
                            ["<Tab>"] = actions.toggle_selection,  -- Just toggle, don't move
                        },
                        n = {  -- normal mode
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<CR>"] = open_all_selected,  -- Override default enter behavior
                            ["<Tab>"] = actions.toggle_selection,  -- Just toggle, don't move
                        },
                    },
                },
            })

            -- Leader key mappings for common pickers
            vim.keymap.set("n", "<leader>ff", function()
                builtin.find_files({
                    hidden = true,
                })
            end)
            vim.keymap.set("n", "<leader>fF", function()
                builtin.find_files({
                    hidden = true,
                    no_ignore = true,
                })
            end)
            vim.keymap.set("n", "<leader>fg", builtin.live_grep)
            vim.keymap.set("n", "<leader>fG", function()
                builtin.live_grep({
                    additional_args = { "--no-ignore" },
                })
            end)
            vim.keymap.set("n", "<leader>fb", builtin.buffers)
            vim.keymap.set("n", "<leader>fh", builtin.help_tags)
        end,
    },
}
