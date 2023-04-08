local M = {}

function M.use(use)
    use {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        requires = { 'nvim-lua/plenary.nvim' }
    }
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make',
        cond = vim.fn.executable 'make' == 1
    }
end

function M.apply()
    require('telescope').setup()
    pcall(require('telescope').load_extension, 'fzf')
end

return M
