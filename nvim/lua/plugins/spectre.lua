return {
    "nvim-pack/nvim-spectre",
    opts = function()
        require("spectre").setup()
        local map = require("helpers.keys").map
        map('n', '<leader>rt', '<cmd>lua require("spectre").toggle()<CR>',
            "Toggle Spectre"
        )
        map('n', '<leader>rW', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', 
            "Search current word"
        )
        map('v', '<leader>rv', '<esc><cmd>lua require("spectre").open_visual()<CR>', 
            "Search current word"
        )
        map('n', '<leader>rw', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
            "Search on current file"
        )
    end
}
