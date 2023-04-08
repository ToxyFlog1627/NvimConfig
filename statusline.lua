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
            section_separators = ''
        },
        sections = {
            lualine_a = { 'mode' },
            lualine_b = { 'branch' },
            lualine_c = { 'filename' },
            lualine_x = { 'searchcount', 'selectioncount', 'diagnostics' },
            lualine_y = { 'filetype' },
            lualine_z = { 'location' }
        }
    }
end

return M
