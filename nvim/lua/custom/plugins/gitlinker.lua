return {
    "ruifm/gitlinker.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = function()
        vim.keymap.set({ "n" }, "<leader>gl", function()
            local url = require "gitlinker".get_buf_range_url("n")
            vim.fn.setreg("+", url)
            print("URL copied to clipboard")
        end, { desc = "Line URL" })

        require "gitlinker".setup({
            callbacks = {
                ["gitlab.usv.no"] = require "gitlinker.hosts".get_gitlab_type_url,
            }
        })
    end
}
