#!/bin/bash
echo "Setting up your Mac..."

function install_brew {
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  
  echo 'eval $(/opt/homebrew/bin/brew shellenv)' >> /Users/$USER/.zshrc
  eval $(/opt/homebrew/bin/brew shellenv)

  brew tap homebrew/cask-versions
}
install_brew

function install_zsh_ohmyzsh {
  echo "Installing zsh"
  brew install zsh

  echo "Installing ohmyzsh and plugins"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  
  echo "Installing iterm2"
  brew install iterm2
}
install_zsh_ohmyzsh

function install_z {
  echo "Installing z"
  git clone https://github.com/rupa/z.git /Users/$USER/home/coding/tools/z/z.sh
}
install_z

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

  gem install rails -v 6.0.2.1
  rbenv rehash

  echo "Test if Rails installed:"
  rails -v

  brew install sqlite3
  brew install mysql
  brew install postgresql

  sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /
}
#install_ruby_on_rails

function install_node_npm {
  brew install node
  node -v
  npm -v
}
#install_node_npm

function install_dotfiles {
  cp ./zsh/.zshrc ~/.zshrc
}
install_dotfiles

# Install all our dependencies with bundle (See Brewfile)
function install_homebrew_bundle {
  brew install mas
  brew bundle
}
install_homebrew_bundle

# Set macOS preferences
# We will run this last because this will reload the shell
source .macos
