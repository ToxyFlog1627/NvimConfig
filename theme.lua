local M = {}

function M.use(use)
    use 'shaunsingh/nord.nvim'
end

function M.apply()
    vim.o.termguicolors = true
    vim.cmd [[colorscheme nord]]
end

return M
