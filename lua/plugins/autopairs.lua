return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter', -- Only load this when you start typing
  dependencies = { 'hrsh7th/nvim-cmp' },
  config = function()
    require('nvim-autopairs').setup({})

    -- Insert `(` after selecting a function or method from the cmp menu
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    require('cmp').event:on('confirm_done', cmp_autopairs.on_confirm_done())
  end,
}
