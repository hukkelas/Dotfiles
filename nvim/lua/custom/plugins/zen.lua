return {
    "folke/zen-mode.nvim",
    opts =
    {
        window = {
            backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
            width = 180,     -- width of the Zen window
        },
        plugins = {
            options = {
                enabled = false,
                ruler = false,   -- disables the ruler text in the cmd line area
                showcmd = false, -- disables the command in the last line of the screen
                -- you may turn on/off statusline in zen mode by setting 'laststatus'
                -- statusline will be shown only if 'laststatus' == 3
                laststatus = 3,             -- turn off the statusline in zen mode
            },
            twilight = { enabled = false }, -- enable to start Twilight when zen mode opens
            gitsigns = { enabled = false }, -- disables git signs
            tmux = { enabled = false },     -- disables the tmux statusline
            -- this will change the font size on kitty when in zen mode
            -- to make this work, you need to set the following kitty options:
            -- - allow_remote_control socket-only
            -- - listen_on unix:/tmp/kitty
        },
    }
}
