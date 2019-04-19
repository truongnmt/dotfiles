chmod +x install.sh
./install.sh

mv ~/Library/Application\ Support/Code/User/settings.json ~/.dotfiles/vsc
mv ~/Library/Application\ Support/Code/User/keybindings.json ~/.dotfiles/vsc
mv ~/Library/Application\ Support/Code/User/snippets ~/.dotfiles/vsc
ln -s ~/.dotfiles/vsc/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -s ~/.dotfiles/vsc/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
ln -s ~/.dotfiles/vsc/snippets ~/Library/Application\ Support/Code/User/
