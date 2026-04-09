return {
    'nvim-telescope/telescope.nvim', version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
        local telescope = require('telescope')
        local builtin = require('telescope.builtin')

        telescope.setup({
            defaults = {
                -- CRITICAL: Prevent Telescope from searching inside the .git folder
                -- Otherwise, your results will be flooded with Git objects
                file_ignore_patterns = {
                    "%.git/",
                }
            },
            pickers = {
                find_files = {
                    hidden = true,
                    no_ignore = true,
                },
                live_grep = {
                    -- live_grep uses ripgrep under the hood, so we pass flags directly to it
                    additional_args = function()
                        return { "--hidden", "--no-ignore" }
                    end
                },
            }
        })

        -- Keymaps remain clean and simple!
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files (All)' })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep (All)' })
        
        -- These pickers naturally don't care about git tracking or dotfiles
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
    end
}
