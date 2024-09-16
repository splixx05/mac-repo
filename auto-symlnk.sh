#!/bin/sh

# create dir dotfiles if it doesn't exist
if [ ! -d ~/dotfiles/.config ]; then
  mkdir -p ~/dotfiles/.config
else
  echo "Dir. 'dotfiles' already exists"
fi

# create symlinks to common files (mac/deb)
# Check if symlink already exists to avoid overwriting
if [ ! -L ~/dotfiles/.config/nvim ]; then
  ln -s ~/res/repo/mac-repo/nvim ~/dotfiles/.config
else
  echo "Symlink for 'nvim' already exists"
fi

if [ ! -L ~/dotfiles/.oh-my-zsh ]; then
  ln -s ~/res/repo/mac-repo/.oh-my-zsh ~/dotfiles
else
  echo "Symlink for '.oh-my-zsh' already exists"
fi

if [ ! -L ~/dotfiles/.p10k.zsh ]; then
  ln -s ~/res/repo/mac-repo/.p10k.zsh ~/dotfiles
else
  echo "Symlink for '.p10k.zsh' already exists"
fi

if [ ! -L ~/dotfiles/.zshrc ]; then
  ln -s ~/res/repo/mac-repo/.zshrc ~/dotfiles
else
  echo "Symlink for '.zshrc' already exists"
fi

# change dir to dotfiles and stow them
cd ~/dotfiles
stow .
