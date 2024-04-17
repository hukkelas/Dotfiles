return {
    'echasnovski/mini.nvim',
    config = function()
        require('mini.ai').setup { n_lines = 500 }
        require("mini.indentscope").setup {
            symbol = "│",
            options = { try_as_border = true },

        }
        require("mini.cursorword").setup()
    end,

}
