local M = {}

function M.apply()
    vim.o.hlsearch = false                              -- Set highlight on search
    vim.wo.number = true                                -- Make line numbers default
    vim.o.mouse = 'a'                                   -- Enable mouse mode
    vim.o.breakindent = true                            -- Enable break indent
    vim.o.undofile = true                               -- Save undo history
    vim.o.ignorecase = true                             -- Case insensitive searching
    vim.o.smartcase = true                              -- Case insensitive searching
    vim.o.updatetime = 250                              -- Decrease update time
    vim.wo.signcolumn = 'yes'                           -- Decrease update time
    vim.o.completeopt = 'menuone,noselect'              -- Set completeopt to have a better completion experience
    vim.api.nvim_set_option("clipboard", "unnamedplus") -- Yanking to system clipboard
    vim.o.tabstop = 4                                   -- Set tab to 4
    vim.o.shiftwidth = 4                                -- Set tab to 4
end

return M
