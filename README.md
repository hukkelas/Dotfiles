```bash
git clone --recurse-submodules -j8 https://github.com/hukkelas/Dotfiles ~/.dotfiles && chmod +x ~/.dotfiles/setup.sh && ~/.dotfiles/setup.sh && chsh -s $(which zsh)
```
**Outside docker**
```bash
git clone --recurse-submodules -j8 https://github.com/hukkelas/Dotfiles ~/.dotfiles && chmod +x ~/.dotfiles/setup.sh && sudo /bin/bash ~/.dotfiles/setup.sh && chsh -s $(which zsh)
```
