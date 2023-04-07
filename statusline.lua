local M = {}

function M.use(use)
    use 'nvim-lualine/lualine.nvim'
end

function M.apply()
    require('lualine').setup {
        options = {
            icons_enabled = false,
            theme = 'nord',
            component_separators = '|',
            section_separators = '',
        },
    }
end

return M
