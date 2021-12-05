

lua << EOF
local lspconfig = require("lspconfig");
local cmp = require'cmp'

-- Enable autopairs plugin
require('nvim-autopairs').setup{disable_filetype = { "TelescopePrompt" , "guihua", "guihua_rust", "clap_input" }}

-- Enable & setup completion plugin
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    end,
  },
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
  }, {
    { name = 'buffer' },
  }),
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Enable navigator plugin
require 'navigator'.setup({
  treesitter_analysis = true,
  default_mapping = false,
  keymaps = {
    { mode = "i", key = "<M-s>", func = "signature_help()" },
    { mode = "n", key = "<M-s>", func = "signature_help()" },
    {key = "gr", func = "require('navigator.reference').reference()"},
    {key = "g0", func = "require('navigator.symbols').document_symbols()"},
    {key = "gW", func = "workspace_symbol()"},
    {key = "<c-]>", func = "require('navigator.definition').definition()"},
    {key = "gD", func = "declaration({ border = 'rounded', max_width = 80 })"},
    {key = "gp", func = "require('navigator.definition').definition_preview()"},
    {key = "gT", func = "require('navigator.treesitter').buf_ts()"},
    {key = "<Leader>gT", func = "require('navigator.treesitter').bufs_ts()"},
    {key = "K", func = "hover({ popup_opts = { border = single, max_width = 80 }})"},
    {key = "<Space>ca", mode = "n", func = "require('navigator.codeAction').code_action()"},
    {key = "<Space>cA", mode = "v", func = "range_code_action()"},
    {key = "<Leader>re", func = "rename()"},
    {key = "<Space>rn", func = "require('navigator.rename').rename()"},
    {key = "<Leader>gi", func = "incoming_calls()"},
    {key = "<Leader>go", func = "outgoing_calls()"},
    {key = "gi", func = "implementation()"},
    {key = "<Space>D", func = "type_definition()"},
    {key = "gL", func = "require('navigator.diagnostics').show_diagnostics()"},
    {key = "gG", func = "require('navigator.diagnostics').show_buf_diagnostics()"},
    {key = "<Leader>dt", func = "require('navigator.diagnostics').toggle_diagnostics()"},
    {key = "]d", func = "diagnostic.goto_next({ border = 'rounded', max_width = 80})"},
    {key = "[d", func = "diagnostic.goto_prev({ border = 'rounded', max_width = 80})"},
    {key = "]r", func = "require('navigator.treesitter').goto_next_usage()"},
    {key = "[r", func = "require('navigator.treesitter').goto_previous_usage()"},
    {key = "<C-LeftMouse>", func = "definition()"},
    {key = "g<LeftMouse>", func = "implementation()"},
    {key = "<Leader>k", func = "require('navigator.dochighlight').hi_symbol()"},
    {key = '<Space>wa', func = 'add_workspace_folder()'},
    {key = '<Space>wr', func = 'remove_workspace_folder()'},
    -- {key = '<Space>ff', func = 'formatting()', mode='n'},
    -- {key = '<Space>ff', func = 'range_formatting()', mode='v'},
    {key = '<Space>wl', func = 'print(vim.inspect(vim.lsp.buf.list_workspace_folders()))'},
    {key = "<Space>la", mode = "n", func = "require('navigator.codelens').run_action()"}
    },
  lsp = {
    disable_lsp = {
        "angularls", "gopls", "flow", "dockerls", "julials",
        "jedi_language_server", "jdtls", "sumneko_lua", "solargraph",
        "denols", "graphql", "dartls", "dotls", "kotlin_language_server", 
        "nimls", "intelephense", "vuels", "phpactor", "omnisharp",
        "r_language_server", "rust_analyzer", "terraformls", "svelte", "texlab", "clojure_lsp"
      }
    },
  icons = {
    icons = true, -- set to false to use system default ( if you using a terminal does not have nerd/icon)
    -- Code action
    code_action_icon = " ", -- "",
    -- code lens
    code_lens_action_icon = " ",
    -- Diagnostics
    diagnostic_head = '',
    diagnostic_err = "",
    diagnostic_warn = "",
    diagnostic_info = [[כֿ]],
    diagnostic_hint = [[כֿ]],

    diagnostic_head_severity_1 = "",
    diagnostic_head_severity_2 = "☣️",
    diagnostic_head_severity_3 = "",
    diagnostic_head_description = "",
    diagnostic_virtual_text = "",
    diagnostic_file = "",
    -- Values
    value_changed = "",
    value_definition = " ",
    -- Treesitter
    match_kinds = {
      var = " ", -- "👹", -- Vampaire
      method = "ƒ ", --  "🍔", -- mac
      ["function"] = "ƒ ", -- "🤣", -- Fun
      parameter = "  ", -- Pi
      associated = " ",
      namespace = "ﰮ ",
      type = " ",
      field = " "
    },
    treesitter_defult = ""
    }
})

require 'lsp_signature'.setup({
  hint_prefix = " "
})

-- protocol.CompletionItemKind = {
--   '', -- Text
--   '', -- Method
--   '', -- Function
--   '', -- Constructor
--   '', -- Field
--   '', -- Variable
--   '', -- Class
--   'ﰮ', -- Interface
--   '', -- Module
--   '', -- Property
--   '', -- Unit
--   '', -- Value
--   '', -- Enum
--   '', -- Keyword
--   '﬌', -- Snippet
--   '', -- Color
--   '', -- File
--   '', -- Reference
--   '', -- Folder
--   '', -- EnumMember
--   '', -- Constant
--   '', -- Struct
--   '', -- Event
--   'ﬦ', -- Operator
--   '', -- TypeParameter
-- }

EOF

