return {
  -- Main LSP Configuration
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
  },
  config = function()
    -- 1. Initialize Mason
    require('mason').setup()

    -- 2. Define your servers and their custom settings here
    local servers = {
     pylsp = {
        settings = {
          pylsp = {
            plugins = {
              pyflakes = { enabled = false },
              pycodestyle = { enabled = false },
              autopep8 = { enabled = false },
              yapf = { enabled = false },
              mccabe = { enabled = false },
              pylsp_mypy = { enabled = false },
              pylsp_black = { enabled = false },
              pylsp_isort = { enabled = false },
            },
          },
        },
      },
     ruff = {
        init_options = {
          settings = {
            lint = {
              extendSelect = { "I" },
            },
          },
        },
      },
    }

    -- 3. Tell mason-lspconfig to ensure these servers are installed
    require('mason-lspconfig').setup({
      ensure_installed = {}, -- Left empty since you are using uv!
    })

    -- =====================================================================
    -- 4. THE NEW PART: Get capabilities from cmp and start the servers
    -- =====================================================================
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    for server_name, server_config in pairs(servers) do
      -- Merge the cmp capabilities into your server config
      server_config.capabilities = capabilities 
      
      -- Hand the config to Neovim and start the server
      vim.lsp.config(server_name, server_config)
      vim.lsp.enable(server_name)
    end
    
  end,
}
