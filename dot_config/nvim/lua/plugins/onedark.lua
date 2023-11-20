return {
  { "navarasu/onedark.nvim" },
  -- Configure LazyVim to load colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
    init = function()
      require("onedark").setup({
        style = "darker",
        transparent = "true",
      })
      require("onedark").load()
    end,
  },
}
