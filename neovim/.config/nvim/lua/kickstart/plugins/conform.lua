---@type string|LazyConfig|LazyPluginSpec|LazySpecImport|string|LazyPluginSpec|LazySpecImport|string|LazyPluginSpec|LazySpecImport[][]
return { -- Autoformat
  'stevearc/conform.nvim',
  opts = {
    notify_on_error = true,
    format_on_save = function(bufnr)
      -- Disable with a global or buffer-local variable
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end
      return { timeout_ms = 500, lsp_format = 'fallback' }
    end,
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
