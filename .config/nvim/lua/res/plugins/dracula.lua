return {
  { "Mofiqul/dracula.nvim" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "dracula",
    },
    config = function()
      vim.cmd.colorscheme("dracula")
    end,
  },
}

