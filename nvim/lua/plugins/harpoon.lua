return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    config = function()
        local harpoon = require("harpoon").setup()
	local map = require("helpers.keys").map
        map("n", "<leader>ha", function() harpoon:list():append() end, "add")
        map("n", "<leader>hl", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, "list")

        map("n", "<leader>h1", function() harpoon:list():select(1) end, "1")
        map("n", "<leader>h2", function() harpoon:list():select(2) end, "2")
        map("n", "<leader>h3", function() harpoon:list():select(3) end, "3")
        map("n", "<leader>h4", function() harpoon:list():select(4) end, "4")
    end,
}
