local M = {}

function M.use(use)
    use 'numToStr/Comment.nvim'
    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim"
    }
end

function M.apply()
    require('Comment').setup()
    require('todo-comments').setup {
        signs = false,
        merge_keywords = false,
        keywords = {
            TODO = { color = "info", alt = { "NOTE", "INFO" } },
            TEST = { color = "test" },
            FIX = { color = "hint", alt = { "BUG" } },
            WARN = { color = "warning" },
            ERROR = { color = "error" }
        },
        colors = {
            error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
            warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
            info = { "DiagnosticInfo", "#2563EB" },
            hint = { "DiagnosticHint", "#10B981" },
            test = { "Identifier", "#7C3AED" }
        }
    }
end

return M
