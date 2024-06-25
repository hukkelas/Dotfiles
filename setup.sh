
#!/bin/bash

if [[ "$OSTYPE" == "darwin"* ]]; then
  brew install fzf fd
  /opt/homebrew/opt/fzf/install --no-bash
else
  sudo apt update && sudo apt install -y zsh curl tmux gcc cmake unzip gettext fd-find nodejs npm python3 python3-pip python3-venv clangd
    # Check the system architecture
   git clone https://github.com/neovim/neovim.git 
   cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo && sudo make install 

  # Check if fzf is already installed
  fzf_dir=~/.fzf
  if [[ ! -d $fzf_dir ]]; then
    apt install -y golang-go
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    sudo ~/.fzf/install
  else
    echo "The folder $fzf_dir already exists"
  fi
fi

# Create symbolic links for configuration files
# ln -s "$HOME/.dotfiles/zsh/.zshenv" "$HOME/.zshenv"
# ln -s "$HOME/.dotfiles/tmux/.tmux.conf" "$HOME/.tmux.conf"
rm ~/.bashrc
rm ~/.profile
rm ~/.inputrc
ln -sv ~/.dotfiles/bash/.profile ~/.profile
ln -sv ~/.dotfiles/bash/.bashrc ~/.bashrc
ln -sv ~/.dotfiles/bash/.inputrc ~/.inputrc

# Install Tmux Plugin Manager (TPM)
tpm_dir=~/.tmux/plugins/tpm
if [[ ! -d $tpm_dir ]]; then
  git clone https://github.com/tmux-plugins/tpm $tpm_dir
  echo "Cloned TPM plugin into $tpm_dir"
else
  echo "The folder $tpm_dir already exists"
fi

# Confirm the action with the user
read -p "Are you sure you want to set Zsh as the default shell? (y/n): " choice



git config --global alias.gsu 'submodule update --init --recursive'
