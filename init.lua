package.path = '/home/tx/.config/nvim/?.lua;' .. package.path

local comments = require('comments')
local git = require('git')
local keybinds = require('keybinds')
local lsp = require('lsp')
local parser = require('parser')
local search = require('search')
local settings = require('settings')
local status_line = require('statusline')
local theme = require('theme')

local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    is_bootstrap = true
    vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
    vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    theme.use(use)
    status_line.use(use)
    search.use(use)
    parser.use(use)
    keybinds.use(use)
    git.use(use)
    comments.use(use)
    lsp.use(use)

    use 'lukas-reineke/indent-blankline.nvim'

    if is_bootstrap then
        require('packer').sync()
    end
end)

if is_bootstrap then
    print '=================================='
    print '    Plugins are being installed   '
    print '    Wait until Packer completes,  '
    print '       then restart nvim          '
    print '=================================='
    return
end

settings.apply()
theme.apply()
status_line.apply()
search.apply()
parser.apply()
keybinds.apply()
git.apply()
comments.apply()
lsp.apply()

require('indent_blankline').setup { show_trailing_blankline_indent = false }
