--------------------------------------------------
-- Herlper functions
--------------------------------------------------
local function enableRoundedBorder()
  local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
  function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or 'rounded'
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
  end
end

local function highlightSymbolUnderCursor(event)
  -- The following two autocommands are used to highlight references of the
  -- word under your cursor when your cursor rests there for a little while.
  --    See `:help CursorHold` for information about when this is executed
  --
  -- When you move your cursor, the highlights will be cleared (the second autocommand).
  local client = vim.lsp.get_client_by_id(event.data.client_id)
  if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
    local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
      buffer = event.buf,
      group = highlight_augroup,
      callback = vim.lsp.buf.document_highlight,
    })

    vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
      buffer = event.buf,
      group = highlight_augroup,
      callback = vim.lsp.buf.clear_references,
    })

    vim.api.nvim_create_autocmd('LspDetach', {
      group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
      callback = function(event2)
        vim.lsp.buf.clear_references()
        vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
      end,
    })
  end
end

local function setupDiagnostic()
  -- global config
  vim.diagnostic.config {
    virtual_text = false,
    underline = false,
    signs = true,
    float = { border = 'single' },
    -- update_in_insert = false,
    -- severity_sort = false,
  }

  -- customer symbols
  local signs = { Error = '󰅚 ', Warn = '󰀪 ', Hint = '󰌶 ', Info = ' ' }
  for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end
end

local function showLineDiagnosticUnderCursor()
  vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
    group = vim.api.nvim_create_augroup('float_diagnostic', { clear = true }),
    callback = function()
      vim.diagnostic.open_float(nil, { focus = false })
    end,
  })
end

local function setupKeymaps(event)
  -- A function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local map = function(mode, keys, func, desc)
    vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
  end

  -- Jump to the definition of the word under your cursor. (To jump back, press <C-T>)
  map('n', 'gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

  -- Find references for the word under your cursor.
  map('n', 'gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

  -- Jump to the implementation of the word under your cursor.
  --  Useful when your language has ways of declaring types without an actual implementation.
  map('n', 'gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

  -- Jump to the type of the word under your cursor.
  --  Useful when you're not sure what type a variable is and you want to see
  --  the definition of its *type*, not where it was *defined*.
  map('n', '<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

  -- Fuzzy find all the symbols in your current document.
  --  Symbols are things like variables, functions, types, etc.
  map('n', '<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

  -- Fuzzy find all the symbols in your current workspace
  --  Similar to document symbols, except searches over your whole project.
  map('n', '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- Rename the variable under your cursor
  --  Most Language Servers support renaming across files, etc.
  map('n', '<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

  -- Execute a code action, usually your cursor needs to be on top of an error
  -- or a suggestion from your LSP for this to activate.
  map('n', '<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  -- Opens a popup that displays documentation about the word under your cursor
  --  See `:help K` for why this keymap
  map('n', 'K', vim.lsp.buf.hover, 'Hover Documentation')

  map('i', '<C-k>', function()
    local nldocs = require 'noice.lsp.docs'
    local message = nldocs.get 'signature'
    nldocs.hide(message)
  end, 'Hide signature help (Insert Mode)')

  map('n', 'gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
end

local function setupLspOverloadsSigKeymaps(event)
  vim.keymap.set('n', '<A-s>', '<cmd>LspOverloadsSignature<CR>', { noremap = true, silent = true, buffer = event.buf })
  vim.keymap.set('i', '<A-s>', '<cmd>LspOverloadsSignature<CR>', { noremap = true, silent = true, buffer = event.buf })
end

local function ensureLspServerInstall(servers, capabilities)
  require('mason').setup()

  -- You can add other tools here that you want Mason to install
  -- for you, so that they are available from within Neovim.
  local ensure_installed = vim.tbl_keys(servers or {})
  vim.list_extend(ensure_installed, { 'stylua' })
  require('mason-tool-installer').setup { ensure_installed = ensure_installed }

  require('mason-lspconfig').setup {
    handlers = {
      function(server_name)
        local server = servers[server_name] or {}
        if server_name == 'tsserver' then
          server_name = 'ts_ls'
        end
        -- This handles overriding only values explicitly passed
        -- by the server configuration above. Useful when disabling
        -- certain features of an LSP (for example, turning off formatting for tsserver)
        server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})

        -- Apply on server
        require('lspconfig')[server_name].setup(server)
      end,
    },
  }
end

--------------------------------------------------

---@type string|LazyConfig|LazyPluginSpec|LazySpecImport|string|LazyPluginSpec|LazySpecImport|string|LazyPluginSpec|LazySpecImport[][]
return { -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    'p00f/clangd_extensions.nvim',
    { 'j-hui/fidget.nvim', opts = {} },
  },
  config = function()
    -- enableRoundedBorder()
    setupDiagnostic()

    --  This function gets run when an LSP attaches to a particular buffer.
    --    That is to say, every time a new file is opened that is associated with
    --    an lsp this function will be executed to configure the current buffer
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
      callback = function(event)
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        setupKeymaps(event)
        highlightSymbolUnderCursor(event)
        -- Add the capability to scroll through overloaded signatures
        -- if client.server_capabilities.signatureHelpProvider then
        --   require('lsp-overloads').setup(client, {})
        --   if client.server_capabilities.signatureHelpProvider then
        --     setupLspOverloadsSigKeymaps(event)
        --   end
        -- end
        -- Python stuff
        if client.name == 'ruff_lsp' then
          -- Disable hover in favor of Pyright
          client.server_capabilities.hoverProvider = false
        end
      end,
    })

    -- LSP servers and clients are able to communicate to each other what features they support.
    --  By default, Neovim doesn't support everything that is in the LSP Specification.
    --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
    --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    -- -- Enable the following language servers
    -- --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
    -- --
    -- --  Add any additional override configuration in the following tables. Available keys are:
    -- --  - cmd (table): Override the default command used to start the server
    -- --  - filetypes (table): Override the default list of associated filetypes for the server
    -- --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
    -- --  - settings (table): Override the default settings passed when initializing the server.
    -- --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
    local servers = {
      -- Typescript
      vtsls = {},
      -- Prettier formatter
      prettierd = {},
      -- markdown
      marksman = {},
      -- lua
      lua_ls = {
        settings = {
          Lua = {
            runtime = { version = 'LuaJIT' },
            workspace = {
              checkThirdParty = false,
              -- Tells lua_ls where to find all the Lua files that you have loaded for your neovim configuration.
              library = { '${3rd}/luv/library', unpack(vim.api.nvim_get_runtime_file('', true)) },
            },
            completion = {
              callSnippet = 'Replace',
            },
            -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
            -- diagnostics = { disable = { 'missing-fields' } },
          },
        },
      },
      -- python lsp
      pyright = {},
      -- python linter
      ruff_lsp = {},
      -- c/cpp
      clangd = {
        cmd = {
          'clangd',
          '--background-index',
          '--clang-tidy',
          '--header-insertion=iwyu',
          '--completion-style=detailed',
          '--function-arg-placeholders',
          '--fallback-style=llvm',
        },
        capabilities = {
          offsetEncoding = { 'utf-16' },
        },
        root_dir = function(fname)
          return require('lspconfig.util').root_pattern(
            '.git',
            'Makefile',
            'configure.ac',
            'configure.in',
            'config.h.in',
            'meson.build',
            'meson_options.txt',
            'build.ninja'
          )(fname) or require('lspconfig.util').root_pattern('compile_commands.json', 'compile_flags.txt')(fname) or require('lspconfig.util').find_git_ancestor(
            fname
          )
        end,
        keys = {
          { '<leader>ch', '<cmd>ClangdSwitchSourceHeader<cr>', desc = 'Switch Source/Header (C/C++)' },
        },
      },
    }

    ensureLspServerInstall(servers, capabilities)
  end,
}
