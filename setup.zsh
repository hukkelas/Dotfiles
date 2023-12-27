if [[ "$OSTYPE" == "darwin"* ]]; then
  brew install fzf
  /opt/homebrew/opt/fzf/install --no-bash
fi

ln -s "$HOME/.dotfiles/zsh/.zshenv" "$HOME/.zshenv"
ln -s "$HOME/.dotfiles/tmux/.tmux.conf" "$HOME/.tmux.conf"

# TPM
tpm_dir=~/.tmux/plugins/tpm
if [[ ! -d $tpm_dir ]]; then
    git clone https://github.com/tmux-plugins/tpm $tpm_dir
    echo "Cloned TPM plugin into $tpm_dir"
else
    echo "The folder $tpm_dir already exists"
fi