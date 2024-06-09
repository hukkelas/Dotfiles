-- Telescope fuzzy finding (all the things)
return {
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        event = 'VimEnter',
        dependencies = {
            "nvim-lua/plenary.nvim",
            -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make",                cond = vim.fn.executable("make") == 1 },
            { 'nvim-telescope/telescope-ui-select.nvim' },
            { 'nvim-tree/nvim-web-devicons',              enabled = vim.g.have_nerd_font },
            { "debugloop/telescope-undo.nvim" },
            "gbprod/yanky.nvim"
        },
        config = function()
            require("telescope").setup({
                extensions = {
                    ['ui-select'] = {
                        require('telescope.themes').get_dropdown(),
                    },
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
                            ["<C-h>"] = "which_key",
                            ["<C-j>"] = require("telescope.actions").move_selection_next,
                            ["<C-k>"] = require("telescope.actions").move_selection_previous,
                        },
                    },
                },
            })

            -- Enable telescope fzf native, if installed
            -- pcall(require("telescope").load_extension, "fzf")
            require("telescope").load_extension("undo")
            pcall(require('telescope').load_extension, 'fzf')
            pcall(require('telescope').load_extension, 'ui-select')
            require("telescope").load_extension("yank_history")

            local map = require("helpers.keys").map
            local tsp = require("telescope.builtin")
            map("n", "<leader>fr", tsp.oldfiles, "Recently opened")
            map("n", "<leader><space>", tsp.buffers, "Open buffers")
            map("n", "<leader>fG", function()
                -- You can pass additional configuration to telescope to change theme, layout, etc.
                tsp.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
                    winblend = 10,
                    previewer = false,
                }))
                -- Search
            end, "Search in current buffer")
            map({ "n", "v" }, "<leader>fc", tsp.command_history, "Command history")
            map({ "n", "v" }, "<leader>fC", tsp.commands, "Command")
            map({ "n", "v" }, "<leader>fb", tsp.buffers, "Buffers")
            map({ "n", "v" }, "<leader>fk", tsp.keymaps, "Keymaps")
            map("n", "<leader>fa", tsp.find_files, "Find all files")
            map("n", "<leader>ff", tsp.git_files, "Git files")
            map("n", "<C-p>", tsp.git_files, "Git files")
            map("n", "<leader>fh", tsp.help_tags, "Help")
            map("n", "<leader>fw", tsp.grep_string, "Current word")
            map("n", "<leader>fg", tsp.live_grep, "Grep")
            map("n", "<leader>fD", tsp.diagnostics, "Diagnostics")
            map("n", "<leader>u", "<cmd>Telescope undo<cr>", "Telescope undo")
            vim.keymap.set('n', '<leader>f.', tsp.resume, { desc = '[S]earch [R]esume' })
            map({ "n", "v" }, "<leader>fT", ":Telescope colorscheme <cr>", "Pick colorscheme")
            map({ "n", "v" }, "<leader>fy", ":Telescope yank_history <cr>", "Yank history")
        end,
    },
}
