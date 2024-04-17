local o = vim.opt

vim.g.have_nerd_font = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Don't show the mode, since it's already in status line
vim.opt.showmode = false

-- Save undo history
vim.opt.undofile = true

-- Enable break indent
vim.opt.breakindent = true

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'
-- Show which line your cursor is on
vim.opt.cursorline = true

o.termguicolors = true
o.shiftwidth = 4
o.tabstop = 4
o.expandtab = true

o.backup = false
-- Minimal number of screen lines to keep above and below the cursor.
o.scrolloff = 10
o.wrap = false
o.incsearch = true
o.ignorecase = true

-- Override the ignorecase option if searching for capital letters.
-- This will allow you to search specifically for capital letters.
o.smartcase = true
o.showcmd = true
o.showmode = true
-- Set highlight on search, but clear on pressing <Esc> in normal mode
o.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

o.history = 1000
o.wildmenu = true
o.wildignore = "*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx"
o.showmatch = true
o.smartindent = true
o.number = true

-- Split to the left/below
o.splitbelow = true
o.splitright = true

-- Show spaces / tabs
local space = "·"
vim.opt.list = true
o.listchars:append {
    tab = "» ",
    multispace = space,
    lead = space,
    trail = space,
    nbsp = "␣"
}
-- o.listchars = "tab:>x,trail:~,extends:>,precedes:<,space:~"
o.list = true

require("custom.lazy")
vim.cmd "colorscheme catppuccin-mocha"
require("custom.remap")


-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})
