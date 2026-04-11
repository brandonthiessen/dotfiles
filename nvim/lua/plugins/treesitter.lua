-- ~/.config/nvim/lua/plugins/treesitter.lua
return {
  {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    lazy = false,
    config = function()
      local ts_ok, ts = pcall(require, "nvim-treesitter")
      if not ts_ok then
        vim.notify("nvim-treesitter not loaded!", vim.log.levels.ERROR)
        return
      end

      ts.setup({
        ensure_installed = { "lua", "python", "c", "cpp", "latex" },
        auto_install = true,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false
        },
        indent = { enable = true },
      })

      -- This autocmd forces Treesitter to start highlighting on these filetypes
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "lua", "python", "c", "cpp", "latex" },
        callback = function()
          vim.treesitter.start()
        end,
      })
    end,
  },
}
