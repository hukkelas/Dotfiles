-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
    "sindrets/diffview.nvim",
    {
        'echasnovski/mini.pairs',
        version = '*',
        opts = function()
            require("mini.pairs").setup()
        end
    },
    {
        'echasnovski/mini.cursorword',
        version = '*',
        opts = function()
            require("mini.cursorword").setup()
        end
    },
    {
        'echasnovski/mini.jump',
        version = '*',
        opts = function()
            require("mini.jump").setup()
        end
    },
}
