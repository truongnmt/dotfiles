#!/bin/bash
echo "Setting up your Mac..."

function install_brew {
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
}
install_brew

function install_zsh_ohmyzsh {
  echo "Installing zsh"
  brew install zsh
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

  echo "Installing ohmyzsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

  echo "Installing iterm2"
  brew cask install iterm2
}
install_zsh_ohmyzsh

function install_powerline {
  # clone
  git clone https://github.com/powerline/fonts.git --depth=1
  # install
  cd fonts
  ./install.sh
  # clean-up a bit
  cd ..
  rm -rf fonts
}
install_powerline

function install_ruby_on_rails {
  brew install rbenv ruby-build

  # Add rbenv to bash so that it loads every time you open a terminal
  echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.zshrc
  source ~/.zshrc

  # Install Ruby
  rbenv install 2.7.0
  rbenv global 2.7.0
  ruby -v

  git config --global color.ui true
  git config --global user.name "TruongNM"
  git config --global user.email "nguyen.manh.truong@moneyforward.co.jp"
  ssh-keygen -t rsa -C "nguyen.manh.truong@moneyforward.co.jp"

  cat ~/.ssh/id_rsa.pub
  echo "Copy and paste the newly generated SSH key and add it to your Github account: https://github.com/settings/ssh"
  
  ssh -T git@github.com

  gem install rails -v 6.0.2.1
  rbenv rehash

  echo "Test if Rails installed:"
  rails -v

  brew install sqlite3
  brew install mysql
  brew install postgresql

  sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /
}
install_ruby_on_rails

function install_node_npm {
  brew install node
  node -v
  npm -v
}
install_node_npm

# function install_dotfiles {
#   cp zsh/.zshrc ~/.zshrc
# }
# install_dotfiles

# Install all our dependencies with bundle (See Brewfile)
function install_homebrew_bundle {
  brew install mas
  brew bundle
}
install_homebrew_bundle


# Symlink the Mackup config file to the home directory
ln -s $HOME/.dotfiles/.mackup.cfg $HOME/.mackup.cfg

# Set macOS preferences
# We will run this last because this will reload the shell
source .macos
mackup restore

echo "[TODO] Import color for iterm"
echo "[TODO] zsh-autosuggestion"
echo "[TODO] zsh-autocomplete, zshrc"
echo "[TODO] xcode"
echo "[TODO] jetbrain toolbox https://www.jetbrains.com/toolbox-app/"
echo "[TODO] Lastpass extension https://lastpass.com/misc_download2.php"
echo "[TODO] add license for Contexts"
echo "[TODO] VirtualBox https://www.virtualbox.org/wiki/Downloads"
echo "[TODO] golang https://golang.org/dl/"
echo "[TODO] brave-browser"
