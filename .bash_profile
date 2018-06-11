export BASH_CONF="bash_profile"

source ~/.zshrc
source ~/dotfiles/.alias
source ~/dotfiles/.export
source ~/dotfiles/.external_bash_profile
source ~/dotfiles/.mirkas

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bash_profile

# added by Anaconda2 5.0.0 installer
export PATH="/Users/hakonhukkelas/anaconda2/bin:$PATH"

# added by Anaconda3 5.0.0 installer
export PATH="/Users/hakonhukkelas/anaconda3/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
