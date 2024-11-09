---@type string|LazyConfig|LazyPluginSpec|LazySpecImport|string|LazyPluginSpec|LazySpecImport|string|LazyPluginSpec|LazySpecImport[][]
return { -- Autoformat
  'stevearc/conform.nvim',
  opts = {
    notify_on_error = true,
    format_on_save = function(bufnr)
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end
      -- Disable "format_on_save lsp_fallback" for languages that don't
      -- have a well standardized coding style. You can add additional
      -- languages here or re-enable it for the disabled ones.
      local lsp_format_opt
      local disable_filetypes = { c = true, cpp = true }
      if disable_filetypes[vim.bo[bufnr].filetype] then
        lsp_format_opt = 'never'
      else
        lsp_format_opt = 'fallback'
      end
      return { timeout_ms = 500, lsp_format = lsp_format_opt }
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
      ['markdown'] = { 'prettierd', 'markdownlint', 'markdown-toc' },
      -- Conform can also run multiple formatters sequentially
      -- python = { "isort", "black" },
      --
      yaml = { 'prettierd' },
      html = { 'prettierd' },
      css = { 'prettierd' },
      javascript = { 'prettierd' },
      typescript = { 'prettierd' },
      javascriptreact = { 'prettierd' },
      typescriptreact = { 'prettierd' },
    },
  },
}
