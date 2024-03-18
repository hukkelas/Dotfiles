return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    config = function()
        local harpoon = require("harpoon").setup()
        vim.keymap.set("n", "<M-i>", function() harpoon:list():append() end, { desc = "add" })
        vim.keymap.set("n", "<M-L>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "list" })

        vim.keymap.set("n", "<M-h>", function() harpoon:list():select(1) end, { desc = "Harpoon 1" })
        vim.keymap.set("n", "<M-j>", function() harpoon:list():select(2) end, { desc = "Harpoon 2" })
        vim.keymap.set("n", "<M-k>", function() harpoon:list():select(3) end, { desc = "Harpoon 3" })
        vim.keymap.set("n", "<M-l>", function() harpoon:list():select(4) end, { desc = "Harpoon 4" })
    end,
}
