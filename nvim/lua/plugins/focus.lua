return {
    "nvim-focus/focus.nvim",
    opts = function()
        require("focus").setup({
            enable = false
        })
    end
}
