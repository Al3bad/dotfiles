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
  default_mapping = true,
  keymaps = {
    { mode = "i", key = "<M-s>", func = "signature_help()" },
    { mode = "n", key = "<M-s>", func = "signature_help()" }
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



