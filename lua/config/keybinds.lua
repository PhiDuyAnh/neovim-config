vim.g.mapleader = " "
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)

-- Format the current file with Ruff
vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format, { desc = '[G]o [F]ormat' })

-- ==========================================
-- LSP KEYMAPS
-- ==========================================
-- Execute a code action, usually your cursor needs to be on top of an error
-- or a suggestion from your LSP for this to activate!
vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { desc = '[C]ode [A]ction' })

-- ==========================================
-- DIAGNOSTIC KEYMAPS (Neovim 0.12+ Syntax)
-- ==========================================
-- Jump backward (-1) and trigger the float window
vim.keymap.set('n', '[d', function()
  vim.diagnostic.jump({ 
    count = -1, 
    on_jump = function() vim.diagnostic.open_float() end 
  })
end, { desc = 'Go to previous [D]iagnostic' })

-- Jump forward (1) and trigger the float window
vim.keymap.set('n', ']d', function()
  vim.diagnostic.jump({ 
    count = 1, 
    on_jump = function() vim.diagnostic.open_float() end 
  })
end, { desc = 'Go to next [D]iagnostic' })

-- Open the floating window for the error under your cursor
-- (Many people map this to Shift+K or <leader>e)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show [E]rror messages' })

-- ==========================================
-- TELESCOPE KEYMAPS (Lazy Loaded)
-- ==========================================
vim.keymap.set('n', '<leader>td', function() 
  require('telescope.builtin').diagnostics() 
end, { desc = '[T]elescope [D]iagnostics' })
