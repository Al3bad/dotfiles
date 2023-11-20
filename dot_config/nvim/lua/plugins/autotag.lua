return {
  "windwp/nvim-ts-autotag",
  dependencies = "nvim-treesitter/nvim-treesitter",
  config = function(_, opts)
    opts.autotag = {
      enable = true,
    }
    require("nvim-treesitter.configs").setup(opts)
  end,
}
