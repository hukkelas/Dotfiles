if [[ "$OSTYPE" == "darwin"* ]]; then
  source "$ZDOTDIR/.macos"
fi

source $ZDOTDIR/alias
# CONDA INIT
conda_path="$ZDOTDIR/conda_init.zsh"

# ZSH options
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
unsetopt HIST_SAVE_NO_DUPS       # Write a duplicate event to the history file

# Completion
source $ZDOTDIR/completion.zsh

# theme
fpath=($ZDOTDIR/theme/ $fpath)
autoload -Uz prompt; prompt

# Autompletion of command up/down arrow
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search


# ZSH directory stack
setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.
alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index


# alt-backspace for word deletion
bindkey '^[^?' backward-kill-word


# Make ZSH like vim
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v
source $ZDOTDIR/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
export KEYTIMEOUT=1
source $ZDOTDIR/scripts/cursor_mode
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line


# Plugins
source $ZDOTDIR/plugins/bd.zsh



source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
# FZF source
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [ -z "$TMUX" ];
then
    tmux attach -t login || tmux new -s login
else
fi
