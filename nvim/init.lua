
local o = vim.opt
o.termguicolors = true
o.cursorline = true
o.shiftwidth = 4
o.tabstop = 4
o.expandtab = true
o.backup = false
o.scrolloff = 10
o.wrap = false
o.incsearch = true
o.ignorecase = true
-- Override the ignorecase option if searching for capital letters.
-- This will allow you to search specifically for capital letters.
o.smartcase = true
o.showcmd = true
o.showmode = true
o.hlsearch = true
o.history = 1000
o.wildmenu = true
o.wildignore = "*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx"
o.showmatch = true
o.smartindent = true
o.number = true

-- Split to the left/below 
o.splitbelow = true
o.splitright = true

require("custom.lazy")
require("custom.remap")

vim.cmd "colorscheme monokai_pro"

