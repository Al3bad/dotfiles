local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting

null_ls.setup({
  -- Prettierd
  sources = {
    null_ls.builtins.formatting.prettierd,
  },
  -- ESLing_d
  -- sources = {
  --   null_ls.builtins.formatting.eslint_d,
  -- },
  -- auto format
  on_attach = function(client)
        if client.resolved_capabilities.document_formatting then
            vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
        end
    end,
})
