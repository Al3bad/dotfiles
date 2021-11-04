
lua <<EOF
require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        disable = {},
    },
    indent = {
        enable = false,
        disable = {}
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
