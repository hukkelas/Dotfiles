local o = vim.opt

o.termguicolors = true
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

-- Show spaces / tabs
local space = "·"
o.listchars:append {
	tab = "│─",
	multispace = space,
	lead = space,
	trail = space,
	nbsp = space
}
-- o.listchars = "tab:>x,trail:~,extends:>,precedes:<,space:~"
o.list = true

require("custom.lazy")
require("custom.remap")

vim.cmd "colorscheme catppuccin-mocha"


require("focus").setup({
    enable = true,

    ui = {
        signcolumn = false
    }
})
vim.cmd "FocusDisable"


-- o.foldmethod = "indent"
