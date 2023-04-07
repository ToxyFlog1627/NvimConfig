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
    require('todo-comments').setup()
end

return M
