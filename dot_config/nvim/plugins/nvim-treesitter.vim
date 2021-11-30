

lua << EOF

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false,
    disable = {}
  },
  autotag = {
    enable = true
  },
  -- nvim-ts-context-commentstring plugin
  context_commentstring = {
    enable = true,
    config = {
      -- Support more languages ( see: https://github.com/JoosepAlviste/nvim-ts-context-commentstring )
    }
  },
  ensure_installed = {
    "javascript",
    "html",
    "css",
    "json",
    "vim",
    "lua"
  }
}
EOF
