set completeopt=menu,menuone,noselect

lua << EOF
local lsp = require('lspconfig')
local protocol = require'vim.lsp.protocol'
local cmp = require'cmp'
local lspkind = require('lspkind')

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    end,
  },
  mapping = {
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
  }, {
    { name = 'buffer' },
  }),
  formatting = {
    format = lspkind.cmp_format({ 
      with_text = false,
      symbol_map = {
        Text = "",
        Method = "",
        Function = "",
        Constructor = "",
        Field = "'",
        Variable = "'",
        Class = "",
        Interface = "",
        Module = "",
        Property = "",
        Unit = "塞",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "'",
        Struct = "פּ",
        Event = "",
        Operator = "",
        TypeParameter = "" 
        }
      })
    }
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

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  local opts = { noremap=true, silent=true }

  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
    vim.api.nvim_command [[augroup END]]
  end

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
end

-- Set up completion using nvim_cmp with LSP source
local capabilities = require('cmp_nvim_lsp').update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

-- Find the root of the working directory
local root_dir = function (fname) 
  return lsp.util.root_pattern(".git", "package.json", "index.html")(fname) 
end

-- LSP servers

lsp.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "javascript", "typescript", "typescriptreact", "typescript.tsx" },
  capabilities = capabilities, 
  root_dir = root_dir 
}

lsp.html.setup {
  on_attach = on_attach, 
  filetypes = {"html", "xml"},
  capabilities = capabilities,
  root_dir = root_dir
}
EOF
