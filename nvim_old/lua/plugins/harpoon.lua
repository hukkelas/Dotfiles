return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    config = function()
        local harpoon = require("harpoon").setup()
	local map = require("helpers.keys").map
        map("n", "<M-i>", function() harpoon:list():append() end, "add")
        map("n", "<M-L>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, "list")

        map("n", "<M-h>", function() harpoon:list():select(1) end, "Harpoon 1")
        map("n", "<M-j>", function() harpoon:list():select(2) end, "Harpoon 2")
        map("n", "<M-k>", function() harpoon:list():select(3) end, "Harpoon 3")
        map("n", "<M-l>", function() harpoon:list():select(4) end, "Harpoon 4")
    end,
}
