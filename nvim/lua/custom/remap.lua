local map = require("helpers.keys").map

map("n", "<leader>e", ":vsplit<CR>", "Vertical split")

map("n", "<leader>o", ":split<CR>", "Horizontal split")
map("n", "<C-q>", ":q<CR>", "close buffer")
map("n", "<leader>q", ":q<CR>", "close buffer")
map("n", "<leader>w", ":bd<CR>", "close buffer")
map("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>", "Buffer 1")
map("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>", "Buffer 2")
map("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>", "Buffer 3")
map("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>", "Buffer 4")
map("n", "<leader>5", ":BufferLineGoToBuffer 5<CR>", "Buffer 5")
map("n", "<leader>6", ":BufferLineGoToBuffer 6<CR>", "Buffer 6")
map("n", "<leader>7", ":BufferLineGoToBuffer 7<CR>", "Buffer 7")

map({ "n", "v" }, "<leader>Q", ":qa<cr>", "Quit all")

local wk = require("which-key")

wk.register(
    {
        -- add group
        ["<leader>"] = {
            t = { name = "Toggle" },
            f = { name = "Find" },
            g = { name = "git" },
        }
    }
)
-- Toggle
map({ "n", "v" }, "<leader>te", ":Neotree toggle<cr>", "Toggle sidebar")
map({ "n", "v" }, "<leader>tt", ":TroubleToggle<cr>", "Trouble toggle")

-- Git
map({ "n", "v" }, "<leader>gB", ":Telescope git_branches<cr>", "View branches")
map({ "n", "v" }, "<leader>gC", ":Telescope git_commits<cr>", "View commits")
map({ "n", "v" }, "<leader>gp", ":Gitsigns preview_hunk_inline<cr>", "View commits")
map({ "n", "v" }, "<leader>gd", ":Gvdiff<cr>", "Git diff")
map({ "n", "v" }, "<leader>gg", ":Git<cr>", "Git status 2")


-- Search
map({ "n", "v" }, "<leader>fc", ":Telescope command_history<cr>", "Command history")
map({ "n", "v" }, "<leader>fb", ":Telescope buffers<cr>", "Buffers")
map({ "n", "v" }, "<leader>fk", ":Telescope keymaps <cr>", "Keymaps")
