return {
    "gbprod/yanky.nvim",
    opts = function()
        require("yanky").setup()
        local map = require("helpers.keys").map
        map({ "n", "x" }, "p", "<Plug>(YankyPutAfter)", "Yank put after")
        map({ "n", "x" }, "P", "<Plug>(YankyPutBefore)", "Yank put before")
        map({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)", "Yank Gput after")
        map({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)", "Yank Gput before")
    end
}
