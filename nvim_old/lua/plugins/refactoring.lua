return {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        require("refactoring").setup()
        local map = require("helpers.keys").map
        map("x", "<leader>Re", ":Refactor extract ")
        map("x", "<leader>Rf", ":Refactor extract_to_file ")

        map("x", "<leader>Rv", ":Refactor extract_var ")

        map({ "n", "x" }, "<leader>Ri", ":Refactor inline_var")

        map("n", "<leader>RI", ":Refactor inline_func")

        map("n", "<leader>Rb", ":Refactor extract_block")
        map("n", "<leader>Rbf", ":Refactor extract_block_to_file")
    end,
}
