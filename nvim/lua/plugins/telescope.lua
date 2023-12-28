-- Telescope fuzzy finding (all the things)
return {
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make", cond = vim.fn.executable("make") == 1 },
            { "debugloop/telescope-undo.nvim" },
        },
        config = function()
            require("telescope").setup({
                extensions = {
                    undo = {
                        mappings = {
                        n = {
                            ["<C-r>"] = require("telescope-undo.actions").restore,
                            ["<C-cr>"] = require("telescope-undo.actions").restore,

                        }
                        }
                    }

                },
                defaults = {
                    mappings = {
                        i = {
                            ["<C-u>"] = false,
                            ["<C-d>"] = false,
                        },
                    },
                },
            })

            -- Enable telescope fzf native, if installed
            pcall(require("telescope").load_extension, "fzf")
            require("telescope").load_extension("undo")

            local map = require("helpers.keys").map
            local tsp = require("telescope.builtin")
            map("n", "<leader>fr", tsp.oldfiles, "Recently opened")
            map("n", "<leader><space>", tsp.buffers, "Open buffers")
            map("n", "<leader>/", function()
                -- You can pass additional configuration to telescope to change theme, layout, etc.
                tsp.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
                    winblend = 10,
                    previewer = false,
                }))
            end, "Search in current buffer")

            map("n", "<leader>fa", tsp.find_files, "Find all files")
            map("n", "<leader>ff", tsp.git_files, "Git files")
            map("n", "<leader>fh", tsp.help_tags, "Help")
            map("n", "<leader>fw", tsp.grep_string, "Current word")
            map("n", "<leader>fg", tsp.live_grep, "Grep")
            map("n", "<leader>fG", tsp.current_buffer_fuzzy_find, "Search current buffer")
            map("n", "<leader>fD", tsp.diagnostics, "Diagnostics")
            map("n", "<leader>u", "<cmd>Telescope undo<cr>", "Telescope undo")


            map("n", "<C-p>", tsp.keymaps, "Search keymaps")
        end,
    },
}
