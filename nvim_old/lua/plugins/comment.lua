-- Enables comments through gcc
return {
    'numToStr/Comment.nvim',
    opts = function ()
        require('Comment').setup()
    end,
}
