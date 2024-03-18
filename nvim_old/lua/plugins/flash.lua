return {
	"folke/flash.nvim",

	opts = function()
		require("flash").setup({
			modes = {
				-- options used when flash is activated through
				-- a regular search with `/` or `?`
				search = {
					-- when `true`, flash will be activated during regular search by default.
					-- You can always toggle when searching with `require("flash").toggle()`
					enabled = false
				},
			},
		})
	end,

	keys = {
		{
			"s",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump()
			end,
			desc = "Flash",
		},
		{
			"S",
			mode = { "n", "x", "o" },
			function()
				require("flash").treesitter()
			end,
			desc = "Flash Treesitter",
		},
		{
			"r",
			mode = "o",
			function()
				require("flash").remote()
			end,
			desc = "Remote Flash",
		},
		{
			"R",
			mode = { "o", "x" },
			function()
				require("flash").treesitter_search()
			end,
			desc = "Treesitter Search",
		},
		{
			"<leader>tF",
			mode = { "n" },
			function()
				require("flash").toggle()
			end,
			desc = "Toggle Flash Search",
		},

	},
}
