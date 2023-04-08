local keybinds = require("keybinds")
local M = {}

function M.use(use)
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip'
        }
    }

    use {
        'neovim/nvim-lspconfig',
        requires = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'j-hui/fidget.nvim',
            'folke/neodev.nvim'
        }
    }
end

function M.apply()
    local servers = {
        clangd = {},
        tsserver = {},
    }

    require('neodev').setup()
    require('mason').setup()
    local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
    local mason_lspconfig = require 'mason-lspconfig'

    mason_lspconfig.setup { ensure_installed = vim.tbl_keys(servers) }

    mason_lspconfig.setup_handlers {
        function(server_name)
            require('lspconfig')[server_name].setup {
                capabilities = capabilities,
                on_attach = function(_, buffer_number)
                    keybinds.lsp(buffer_number)
                    vim.api.nvim_buf_create_user_command(buffer_number, 'Format', function()
                        vim.lsp.buf.format()
                    end, { desc = 'Format current buffer with LSP' })
                end,
                settings = servers[server_name]
            }
        end,
    }

    require('fidget').setup()

    local cmp = require 'cmp'
    local luasnip = require 'luasnip'

    cmp.setup {
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end
        },
        mapping = cmp.mapping.preset.insert {
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<CR>'] = cmp.mapping.confirm {
                behavior = cmp.ConfirmBehavior.Replace,
                select = true
            },
            ['<Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                else
                    fallback()
                end
            end, { 'i', 's' }),
            ['<S-Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { 'i', 's' })
        },
        sources = {
            { name = 'nvim_lsp' },
            { name = 'luasnip' }
        }
    }
end

return M
