local map = require("helpers.keys").map

map("n", "<leader>e", ":vsplit<CR>", "Vertical split")

map("n", "<leader>o", ":split<CR>", "Horizontal split")
map("n", "<C-q>", ":q<CR>", "close buffer")
map("n", "<leader>q", ":q<CR>", "close window")
map("n", "<leader>w", ":bd<CR>", "close buffer")
map("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>", "Buffer 1")
map("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>", "Buffer 2")
map("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>", "Buffer 3")
map("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>", "Buffer 4")
map("n", "<leader>5", ":BufferLineGoToBuffer 5<CR>", "Buffer 5")
map("n", "<leader>6", ":BufferLineGoToBuffer 6<CR>", "Buffer 6")
map("n", "<leader>7", ":BufferLineGoToBuffer 7<CR>", "Buffer 7")
map("n", "<leader>8", ":BufferLineGoToBuffer 8<CR>", "Buffer 8")
map("n", "<leader>9", ":BufferLineGoToBuffer 9<CR>", "Buffer 9")
map("n", "<leader>0", ":BufferLineGoToBuffer 10<CR>", "Buffer 10")

-- Window resize
-- map({"n", "v"}, "<A-h>", ":vertical resize -10<cr>", "Resize -10")
-- map({"n", "v"}, "<A-l>", ":vertical resize +10<cr>", "Resize -+10")
-- map({"n", "v"}, "<M-h>", ":vertical resize -10<cr>", "Resize -10")
-- map({"n", "v"}, "<M-l>", ":vertical resize +10<cr>", "Resize -+10")


-- Key cursor in the middle
map("v", "J", ":m '>+1<CR>gv=gv", "Move select up")
map("v", "K", ":m '<-2<CR>gv=gv", "Move select down")

map("n", "J", "mzJ`z", "")
map("n", "<C-d>", "<C-d>zz", "Jump half page down")
map("n", "<C-u>", "<C-u>zz", "Jump half page up")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("x", "<leader>p", [["_dP]], "Paste without yank")

map({ "v" }, "<", "<gv", "Indent without loosing selection")
map({ "v" }, ">", ">gv", "Indent without loosing selection")

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

map("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", "Tmux sessionizer new")


-- Quick fix list
map({ "n", "v" }, "<C-e>", ":ClangdSwitchSourceHeader <cr>", "Clangd switch source<->header")
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
            r = { name = "Replace Spectre" },
            R = { name = "Refactor" },

        }
    }
)
-- require('which-key').register {
--     ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
--     ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
--     ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
--     ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
--     ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
--     ['<leader>t'] = { name = '[T]oggle', _ = 'which_key_ignore' },
-- }
-- Toggle
map({ "n", "v" }, "<leader>te", ":Neotree reveal float <cr>", "Toggle sidebar")
map({ "n", "v" }, "<leader>tt", ":TroubleToggle<cr>", "Trouble toggle")
map({ "n", "v" }, "<leader>z", ":ZenMode <cr>", "ZenMode")
map({ "n", "v" }, "<leader>tf", ":FocusToggle <cr>", "Toggle focus")

-- Git
map({ "n", "v" }, "<leader>gB", ":Telescope git_branches<cr>", "View branches")
map({ "n", "v" }, "<leader>gC", ":Telescope git_commits<cr>", "View commits")
map({ "n", "v" }, "<leader>gc", require("telescope.builtin").git_bcommits, "View commits for current buffer")
map({ "n", "v" }, "<leader>gmc", ":Git commit -m ", "Git make commit")
map({ "n", "v" }, "<leader>gmP", ":Git push <cr>", "Git push")

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
map({ "n" }, "<leader>gl", function()
    local url = require "gitlinker".get_buf_range_url("n")
    vim.fn.setreg("+", url)
    print("URL copied to clipboard")
end, "Line URL")






vim.keymap.set("n", "<leader>sr", function()
    return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true, desc = "Rename symbol" })

local harpoon = require('harpoon')
harpoon:setup({})



-- buffers
map({ "n", "v", }, "<leader>bC", ":%bd|e# <cr>", "Close all buffers")
map("n", "<M-h>", function() harpoon:list():select(1) end, "Harpoon 1")
map("n", "<M-j>", function() harpoon:list():select(2) end, "Harpoon 2")
map("n", "<M-k>", function() harpoon:list():select(3) end, "Harpoon 3")
map("n", "<M-l>", function() harpoon:list():select(4) end, "Harpoon 4")

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
