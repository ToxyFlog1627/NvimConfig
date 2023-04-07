local M = {}

function M.use(use)
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'
    use 'lewis6991/gitsigns.nvim'
end

function M.apply()
    require('gitsigns').setup {
        signs = {
            add = { text = '+' },
            change = { text = '~' },
            delete = { text = '-' },
            topdelete = { text = '‾' },
            changedelete = { text = '~' },
        },
    }
end

return M
