return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local telescope = require("telescope")
            local actions = require("telescope.actions")
            local action_state = require("telescope.actions.state")

            local builtin = require("telescope.builtin")

            local function open_entry(entry)
                if not entry then
                    return
                end

                local path = entry.path or entry.value
                if not path then
                    return
                end

                path = vim.fn.fnamemodify(path, ":p")

                vim.cmd("edit " .. vim.fn.fnameescape(path))

                -- live_grep entries have line/column information
                if entry.lnum then
                    vim.api.nvim_win_set_cursor(0, {
                        entry.lnum,
                        math.max((entry.col or 1) - 1, 0),
                    })
                end
            end

            local function open_all_selected(prompt_bufnr)
                local picker = action_state.get_current_picker(prompt_bufnr)
                local multi_selection = picker:get_multi_selection()
                local current_entry = action_state.get_selected_entry()

                actions.close(prompt_bufnr)

                -- No multi-selection: behave like normal Telescope <CR>
                if #multi_selection == 0 then
                    open_entry(current_entry)
                    return
                end

                open_entry(multi_selection[1])

                -- Load additional selections as buffers without opening tabs.
                for i = 2, #multi_selection do
                    local entry = multi_selection[i]
                    local path = entry.path or entry.value

                    if path then
                        path = vim.fn.fnamemodify(path, ":p")
                        vim.cmd("badd " .. vim.fn.fnameescape(path))
                    end
                end
            end

            telescope.setup({
                defaults = {
                    file_ignore_patterns = {
                        "%.git/",
                    },
                    mappings = {
                        i = {
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<CR>"] = open_all_selected,
                            ["<Tab>"] = actions.toggle_selection,
                        },
                        n = {
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<CR>"] = open_all_selected,
                            ["<Tab>"] = actions.toggle_selection,
                        },
                    },
                },
            })

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
            vim.keymap.set("n", "<leader>fr", builtin.lsp_references)
        end,
    },
}
