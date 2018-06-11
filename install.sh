# Brew install
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap caskroom/cask
brew install brew-cask
brew tap caskroom/versions


brew cask install google-chrome
brew cask install spotify 
brew cask install virtualbox
brew cask install atom
brew cask install visual-studio-code
brew cask install alfred
brew cask install iterm2
brew cask install transmission


# oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
brew install zsh-syntax-highlighting

git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

git config --global core.excludesfile ~/.gitignore

