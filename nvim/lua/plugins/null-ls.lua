return {
	"jay-babu/mason-null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"nvimtools/none-ls.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
        require("mason-null-ls").setup({
            ensure_installed = {"stylua", "ruff" }
        })
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.ruff,
				null_ls.builtins.formatting.ruff_format,
				null_ls.builtins.formatting.stylua,
			},
		})
	end,
}
