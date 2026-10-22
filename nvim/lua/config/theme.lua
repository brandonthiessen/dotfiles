local theme = {
    colorscheme = "tokyonight-night",
    transparent = true,
}

vim.opt.termguicolors = true

local transparent_groups = {
    "Normal",
    "NormalNC",
    "SignColumn",
    "EndOfBuffer",
    "StatusLine",
    "StatusLineNC",
    "TabLine",
    "TabLineFill",
    "FoldColumn",
    "Pmenu",
    "NormalFloat",
    "FloatBorder",
}

local function apply_background()
    if not theme.transparent then
        return
    end

    for _, group in ipairs(transparent_groups) do
        vim.api.nvim_set_hl(0, group, { bg = "NONE" })
    end
end

vim.cmd.colorscheme(theme.colorscheme)
apply_background()

vim.api.nvim_create_autocmd("ColorScheme", {
    callback = apply_background,
})
