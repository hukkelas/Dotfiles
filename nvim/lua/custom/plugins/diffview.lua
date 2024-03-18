return {
    "sindrets/diffview.nvim",
    -- [c , ]c for jumping to/from changes
    -- for keybinds: https://github.com/sindrets/diffview.nvim#configuration
    opts = function()
        local toggle_diffview = function()
            local lib = require("diffview.lib")
            local view = lib.get_current_view()
            if view then
                vim.cmd.DiffviewClose()
            else
                vim.cmd.DiffviewOpen()
            end
        end
        vim.keymap.setmap({ "n", "v" }, "<leader>gd", function() toggle_diffview() end, { desc = "Git diff" })
    end
}
