---@type string|LazyConfig|LazyPluginSpec|LazySpecImport|string|LazyPluginSpec|LazySpecImport|string|LazyPluginSpec|LazySpecImport[][]
return { -- Autoformat
  'stevearc/conform.nvim',
  opts = {
    notify_on_error = true,
    format_on_save = {
      timeout_ms = 2000,
      async = false, -- not recommended to change
      quiet = false, -- not recommended to change
      lsp_format = 'fallback',
      -- lsp_fallback = true,
    },
    formatters_by_ft = {
      lua = { 'stylua' },
      ['markdown'] = { { 'prettierd', 'prettier' }, 'markdownlint', 'markdown-toc' },
      -- Conform can also run multiple formatters sequentially
      -- python = { "isort", "black" },
      --
      yaml = { { 'prettierd', 'prettier' } },
      html = { { 'prettierd', 'prettier' } },
      css = { { 'prettierd', 'prettier' } },
      javascript = { { 'prettierd', 'prettier' } },
      typescript = { { 'prettierd', 'prettier' } },
      javascriptreact = { { 'prettierd', 'prettier' } },
      typescriptreact = { { 'prettierd', 'prettier' } },
    },
  },
}
