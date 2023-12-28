export DOTFILES=$HOME/.dotfiles
export ZDOTDIR=$DOTFILES/zsh/
export NVIM_APP_NAME=$DOTFILES/nvim 
export XDG_CONFIG_HOME=$DOTFILES

export EDITOR="nvim"
export VISUAL="nvim"


# zsh
export ZDOTDIR="$DOTFILES/zsh"
export HISTFILE="$ZDOTDIR/.zhistory"    # History filepath
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file


export TMUXP_CONFIGDIR="$DOTFILES/tmuxp"


# Man pages
export MANPAGER='nvim +Man!'



# fzf
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

FZF_COLORS="bg+:-1,\
fg:gray,\
fg+:white,\
border:black,\
spinner:0,\
hl:yellow,\
header:blue,\
info:green,\
pointer:red,\
marker:blue,\
prompt:gray,\
hl+:red"

export FZF_DEFAULT_OPTS="--height 60% \
--border sharp \
--layout reverse \
--color '$FZF_COLORS' \
--prompt '∷ ' \
--pointer ▶ \
--marker ⇒"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -n 10'"
export FZF_COMPLETION_DIR_COMMANDS="cd pushd rmdir tree ls"


export PATH="$DOTFILES/bin:$PATH"PATH="/usr/local/bin:$PATH"
