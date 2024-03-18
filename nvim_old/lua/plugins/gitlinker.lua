return {
    "ruifm/gitlinker.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = function()
        require "gitlinker".setup({
            callbacks = {
                        ["gitlab.usv.no"] = require"gitlinker.hosts".get_gitlab_type_url,
            }
        })
    end
}
