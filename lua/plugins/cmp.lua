return {
  -- The autocompletion engine
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter', -- Only load this when you start typing
  dependencies = {
    -- Connects nvim-cmp to your LSP
    'hrsh7th/cmp-nvim-lsp',
    -- Snippet engine (required for cmp to work properly)
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
  },
  config = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      -- Set up your keyboard shortcuts for the menu
      mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(), -- Manually trigger it
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Press Enter to confirm
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item() -- Press Tab to go down the list
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item() -- Shift+Tab to go up
          else
            fallback()
          end
        end, { 'i', 's' }),
      }),
      -- Tell the engine where to get its data (from the LSP)
      sources = {
        { name = 'nvim_lsp' },
      },
    })
  end,
}
