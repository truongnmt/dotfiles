#!/bin/bash
echo "Setting up your Mac..."

function install_dotfiles {
  cp zsh/zshrc ~/.zshrc
}

function install_brew {
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew install caskroom/cask/brew-cask
}

function install_terminal {
  brew install zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  export ZSH_CUSTOM=~/.oh-my-zsh
  git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

  brew cask install iterm2
}

function install_ruby_on_rails {
  # Add rbenv to bash so that it loads every time you open a terminal
  echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.zshrc
  source ~/.zshrc

  # Install Ruby
  rbenv install 2.5.1
  rbenv global 2.5.1
  ruby -v

  git config --global color.ui true
  git config --global user.name "TruongNM"
  git config --global user.email "truongnmt.dev@gmail.com"
  ssh-keygen -t rsa -C "truongnmt.dev@gmail.com"

  echo "Copy and paste the newly generated SSH key and add it to your Github account: https://github.com/settings/ssh"
  cat ~/.ssh/id_rsa.pub

  ssh -T git@github.com

  gem install rails -v 5.2.0
  rbenv rehash

  echo "Test if Rails installed:"
  rails -v
}

install_dotfiles
install_brew
install_terminal
install_ruby_on_rails

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

# Symlink the Mackup config file to the home directory
ln -s $HOME/.dotfiles/.mackup.cfg $HOME/.mackup.cfg

# Set macOS preferences
# We will run this last because this will reload the shell
source .macos

echo "[TODO] Sync setting with iterm"
echo "[TODO] List of manually install apps:"
echo "https://www.jetbrains.com/toolbox/app/"
echo "https://github.com/kmikiy/SpotMenu"
echo "https://zalo.me/may-tinh"
echo "https://itunes.apple.com/us/app/shazam/id897118787?l=fr&mt=12"
echo "https://www.getpostman.com/apps"
echo "http://rescuetime.com/"
echo "https://kapeli.com/dash"