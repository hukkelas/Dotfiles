return {
    "nvim-pack/nvim-spectre",
    opts = function()
        require("spectre").setup()
        vim.keymap.set('n', '<leader>rt', '<cmd>lua require("spectre").toggle()<CR>', { desc = "Toggle Spectre" })
        vim.keymap.set('n', '<leader>rW', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
            { desc = "Search current word" })
        vim.keymap.set('v', '<leader>rv', '<esc><cmd>lua require("spectre").open_visual()<CR>',
            { desc = "Search current word" })
        vim.keymap.set('n', '<leader>rw', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
            { desc = "Search on current file" })
        vim.keymap.set("n", "<leader>rR", function() require("spectre.actions").run_replace() end,
            { desc = "Replace all" })
    end
}
