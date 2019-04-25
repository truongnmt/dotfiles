## Setup Github ssh
https://help.github.com/en/articles/adding-a-new-ssh-key-to-your-github-account

## Initial script
```
chmod +x install.sh
./install.sh
```

## Setting VSC config
```
mv ~/Library/Application\ Support/Code/User/settings.json ~/.dotfiles/vsc 
mv ~/Library/Application\ Support/Code/User/keybindings.json ~/.dotfiles/vsc 
mv ~/Library/Application\ Support/Code/User/snippets ~/.dotfiles/vsc 

rm ~/Library/Application\ Support/Code/User/settings.json 
rm ~/Library/Application\ Support/Code/User/keybindings.json 
rm -R ~/Library/Application\ Support/Code/User/snippets 

ln -s ~/.dotfiles/vsc/settings.json ~/Library/Application\ Support/Code/User/settings.json 
ln -s ~/.dotfiles/vsc/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json 
ln -s ~/.dotfiles/vsc/snippets ~/Library/Application\ Support/Code/User/
```
