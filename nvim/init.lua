-- ~/.config/nvim/init.lua
-- ==============================
-- Bootstrap lazy.nvim
-- ==============================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- ==============================
-- Basic Options
-- ==============================
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.signcolumn = "yes"
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99
vim.opt.mouse = ""
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- ==============================
-- Plugins
-- ==============================
require("lazy").setup("plugins", {
    performance = {
        rtp = {
            reset = false,  -- very important so Treesitter can find its modules
        }
    }
})

-- ==============================
-- Colors
-- ==============================
vim.cmd("colorscheme catppuccin-mocha")

-- Fix highlighting issues
vim.cmd("hi Normal guibg=NONE")
vim.cmd("hi SignColumn guibg=NONE")
vim.cmd("hi NormalFloat guibg=NONE")
vim.cmd("hi StatusLine guibg=NONE")
vim.cmd("hi Pmenu guibg=NONE")

-- Fix floating panel highlighting issues
local hl = vim.api.nvim_get_hl(0, { name = "Normal" })
local bg = hl.bg and string.format("#%06x", hl.bg) or "#0f111a"
vim.api.nvim_set_hl(0, "NormalFloat", { bg = bg })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = bg })

-- ==============================
-- JS/TS Indentation
-- ==============================
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    callback = function()
        for _, opt in ipairs({"shiftwidth","tabstop","softtabstop"}) do
            vim.bo[opt] = 2
        end
        vim.bo.expandtab = true
    end,
})

-- ==============================
-- LaTeX autocompilation
-- ==============================
vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "*.tex",
    callback = function()
        vim.fn.jobstart({ "latexmk", "-pdf", "-pvc" }, { detach = true })
    end,
})


-- ==============================
-- OSC 52 (Clipboard)
-- ==============================
vim.g.clipboard = {
  name = 'OSC 52',
  copy = {
    ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
    ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
  },
  paste = {
    ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
    ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
  },
}
