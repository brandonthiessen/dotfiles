return {
    {
        "neoclide/coc.nvim",
        branch = "release",
        lazy = false,
        config = function()
            -- Ctrl-j / Ctrl-k rotate completion menu
            vim.cmd([[
            inoremap <silent><expr> <C-j>
            \ coc#pum#visible() ? coc#pum#next(1) : "\<C-j>"

            inoremap <silent><expr> <C-k>
            \ coc#pum#visible() ? coc#pum#prev(1) : "\<C-k>"
            ]])

            -- Trigger completion with Ctrl-Space
            vim.cmd([[ inoremap <silent><expr> <C-Space> coc#refresh() ]])

            -- Confirm completion manually with TAB
            vim.cmd([[
            inoremap <silent><expr> <TAB>
            \ coc#pum#visible() ? coc#pum#confirm() : "\<Tab>"
            ]])

            -- Basic navigation
            vim.keymap.set("n", "[g", "<Plug>(coc-diagnostic-prev)", { silent = true })
            vim.keymap.set("n", "]g", "<Plug>(coc-diagnostic-next)", { silent = true })
            vim.keymap.set("n", "gd", "<Plug>(coc-definition)", { silent = true })
            vim.keymap.set("n", "gr", "<Plug>(coc-references)", { silent = true })

            -- Hover
            vim.cmd([[ nnoremap <silent> K :call CocActionAsync('doHover')<CR> ]])
        end,
    },
}

