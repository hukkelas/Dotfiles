return {
    "nvim-pack/nvim-spectre",
    opts = function()
        require("spectre").setup()
        local map = require("helpers.keys").map
        vim.keymap.setmap('n', '<leader>rt', '<cmd>lua require("spectre").toggle()<CR>', { desc = "Toggle Spectre" })
        vim.keymap.setmap('n', '<leader>rW', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
            { desc = "Search current word" })
        vim.keymap.setmap('v', '<leader>rv', '<esc><cmd>lua require("spectre").open_visual()<CR>',
            { desc = "Search current word" })
        vim.keymap.setmap('n', '<leader>rw', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
            { desc = "Search on current file" })
        vim.keymap.setmap("n", "<leader>rR", function() require("spectre.actions").run_replace() end,
            { desc = "Replace all" })
    end
}
