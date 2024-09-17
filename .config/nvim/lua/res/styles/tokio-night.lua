return {
  "folke/tokyonight.nvim",
  priority = 1000,
  config = function()

    require("tokyonight").setup({
      style = "night",
      transparent = transparent,
      styles = {
        sidebars = transparent and "transparent" or "dark",
        floats = transparent and "transparent" or "dark",
      },
        })

    vim.cmd("colorscheme tokyonight")
  end,
}
