local M = {}

local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

local status_ok_2, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_2 then
	return
end

M.setup = function(opts)

	-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
  -- clangd = {},
  -- gopls = {},
  -- pyright = {},
  -- rust_analyzer = {},
  tsserver = {},
  sumneko_lua = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

	-- Setup mason so it can manage external tooling
	mason.setup()

	mason_lspconfig.setup {
		ensure_installed = vim.tbl_keys(servers),
	}

	mason_lspconfig.setup_handlers {
		function(server_name)
			require('lspconfig')[server_name].setup {
				capabilities = opts.capabilities,
				on_attach = opts.on_attach,
				settings = servers[server_name],
			}
		end,
	}

end

return M
