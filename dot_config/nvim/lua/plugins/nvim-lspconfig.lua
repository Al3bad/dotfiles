-- Get all jar files in java/lib folder
local jarFiles = {}
local p = vim.fn.expand("~/dev/java/lib/")
local f = io.popen("ls " .. p)
if f then
  local str = f:read("*a")
  for s in str:gmatch("[^\r\n]+") do
    table.insert(jarFiles, p .. s)
  end
else
  print("failed to read jar files")
end

return {
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    -------------------------------------------------------
    --> Servers
    -------------------------------------------------------
    servers = {
      eslint = {
        settings = {
          -- helps eslint find the eslintrc when it's placed in a subfolder instead of the cwd root
          workingDirectory = { mode = "auto" },
        },
      },
      jdtls = {},
      omnisharp = {
        keys = {
          {
            "gd",
            function()
              require("omnisharp_extended").telescope_lsp_definitions()
            end,
            desc = "Goto Definition",
          },
        },
        enable_roslyn_analyzers = true,
        organize_imports_on_format = true,
        enable_import_completion = true,
        filetypes = { "cs", "vb", "csproj", "sln", "slnx", "props" },
      },
    },
    -------------------------------------------------------
    --> Servers Setup
    -------------------------------------------------------
    ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
    setup = {
      eslint = function()
        vim.api.nvim_create_autocmd("BufWritePre", {
          callback = function(event)
            if not require("lazyvim.util").format.enabled() then
              -- exit early if autoformat is not enabled
              return
            end

            local client = vim.lsp.get_active_clients({ bufnr = event.buf, name = "eslint" })[1]
            if client then
              local diag = vim.diagnostic.get(event.buf, { namespace = vim.lsp.diagnostic.get_namespace(client.id) })
              if #diag > 0 then
                vim.cmd("EslintFixAll")
              end
            end
          end,
        })
      end,
      -- Override the default jdtls server startup to use nvim-jdtls.
      jdtls = function()
        return true -- avoid duplicate servers
      end,
      omnisharp = function(_, _)
        require("lazyvim.util").lsp.on_attach(function(client, _)
          if client.name == "omnisharp" then
            ---@type string[]
            local tokenModifiers = client.server_capabilities.semanticTokensProvider.legend.tokenModifiers
            for i, v in ipairs(tokenModifiers) do
              tokenModifiers[i] = v:gsub(" ", "_")
            end
            ---@type string[]
            local tokenTypes = client.server_capabilities.semanticTokensProvider.legend.tokenTypes
            for i, v in ipairs(tokenTypes) do
              tokenTypes[i] = v:gsub(" ", "_")
              print(tokenTypes[i])
            end
          end
        end)
        return false
      end,
    },
  },
}
