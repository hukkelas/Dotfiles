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



-- Key cursor in the middle
map("v", "J", ":m '>+1<CR>gv=gv", "Move select up")
map("v", "K", ":m '<-2<CR>gv=gv", "Move select down")

map("n", "J", "mzJ`z", "")
map("n", "<C-d>", "<C-d>zz", "Jump half page down")
map("n", "<C-u>", "<C-u>zz", "Jump half page up")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("x", "<leader>p", [["_dP]], "Paste without yank")
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

map("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", "Tmux sessionizer new")


-- Quick fix list
map("n", "<C-e>", "<cmd>cnext<CR>zz", "Quick fix cnext")
map("n", "<C-E>", "<cmd>cprev<CR>zz", "Quick fix cprev")
-- map("n", "<leader>k", "<cmd>lnext<CR>zz", "Quick fix lnext")
-- map("n", "<leader>j", "<cmd>lprev<CR>zz", "Quick fix lprev")

map({ "n", "v" }, "<leader>Q", ":qa<cr>", "Quit all")

local wk = require("which-key")

wk.register(
    {
        -- add group
        ["<leader>"] = {
            t = { name = "Toggle" },
            f = { name = "Find" },
            g = { name = "git" },
            P = { name = "Session" },
        }
    }
)
-- Toggle
map({ "n", "v" }, "<leader>te", ":Neotree toggle<cr>", "Toggle sidebar")
map({ "n", "v" }, "<leader>tt", ":TroubleToggle<cr>", "Trouble toggle")
map({ "n", "v" }, "<leader>tz", ":ZenMode <cr>", "ZenMode")

-- Git
map({ "n", "v" }, "<leader>gB", ":Telescope git_branches<cr>", "View branches")
map({ "n", "v" }, "<leader>gC", ":Telescope git_commits<cr>", "View commits")
map({ "n", "v" }, "<leader>gp", ":Gitsigns preview_hunk_inline<cr>", "View commits")
map({ "n", "v" }, "<leader>gg", ":Git<cr>", "Git status 2")
local toggle_diffview = function()
    local lib = require("diffview.lib")
    local view = lib.get_current_view()
    if view then
        vim.cmd.DiffviewClose()
    else
        vim.cmd.DiffviewOpen()
    end
end
map({ "n", "v" }, "<leader>gd", function() toggle_diffview() end, "Git diff")
map({"n"}, "<leader>gl", function ()
   local url = require"gitlinker".get_buf_range_url("n") 
    vim.fn.setreg("+", url)
    print("URL copied to clipboard")

end, "Line URL")

-- Search
map({ "n", "v" }, "<leader>fc", ":Telescope command_history<cr>", "Command history")
map({ "n", "v" }, "<leader>fb", ":Telescope buffers<cr>", "Buffers")
map({ "n", "v" }, "<leader>fk", ":Telescope keymaps <cr>", "Keymaps")





vim.keymap.set("n", "<leader>sr", function()
  return ":IncRename " .. vim.fn.expand("<cword>") 
end, { expr = true , desc="Rename symbol"})

local harpoon = require('harpoon')
harpoon:setup({})

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
    { desc = "Open harpoon window" })



-- buffers
map({"n", "v",}, "<leader>bC", ":%bd|e# <cr>", "Close all buffers")
