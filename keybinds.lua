local M = {}

function M.use(use)
    use "folke/which-key.nvim"
end

function M.apply()
    -- Help for available keybinds:
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    require("which-key").setup()

    vim.g.mapleader = ' '
    vim.g.maplocalleader = ' '

    vim.keymap.set('i', 'jj', '<Esc>', { silent = true })

    local telescope = require('telescope.builtin')
    local nmap = function(keys, func, desc)
        vim.keymap.set('n', keys, func, { desc = desc })
    end

    nmap('<leader>e', telescope.oldfiles, 'Find recently opened files')
    nmap('<leader><leader>', telescope.buffers, 'Find existing buffers')
    nmap('<leader>f', function()
        telescope.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
            winblend = 10,
            previewer = false,
        })
    end, 'Search in current buffer')

    nmap('<leader>sf', telescope.find_files, 'Search Files')
    nmap('<leader>sh', telescope.help_tags, 'Search Help')
    nmap('<leader>sg', telescope.live_grep, 'Search with Grep')
    nmap('<leader>sd', telescope.diagnostics, 'Search Diagnostics')
end

function M.lsp(buffer_number)
    local map = function(keys, func, desc)
        vim.keymap.set({ 'n', 'i' }, keys, func, { buffer = buffer_number, desc = desc })
    end

    map('<C-r>', vim.lsp.buf.rename, 'Rename')
    map('<M-CR>', vim.lsp.buf.code_action, 'Code action')
    map('<C-d>', vim.lsp.buf.type_definition, 'Type Definition')
    map('<C-k>', vim.lsp.buf.signature_help, 'Documentation')
end

return M
