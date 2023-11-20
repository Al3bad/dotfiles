return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- folder plugin
    -- require("ufo").setup({})
    -- ensure installed
    if type(opts.ensure_installed) == "table" then
      vim.list_extend(opts.ensure_installed, { "java", "typescript", "tsx", "html", "css", "python" })
    end
  end,
}
