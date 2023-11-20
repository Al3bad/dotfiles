return {
  "nvim-neo-tree/neo-tree.nvim",
  optional = true,
  cmd = "Neotree",
  keys = {
    { "<leader>e", "<CMD>Neotree toggle<CR>", desc = "File Explorer" },
  },
  opts = function(_, opts)
    opts.open_files_do_not_replace_types = opts.open_files_do_not_replace_types
      or { "terminal", "Trouble", "qf", "Outline" }
    table.insert(opts.open_files_do_not_replace_types, "edgy")
  end,
}
