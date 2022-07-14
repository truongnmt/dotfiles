## Setup XCode first and agree to license
sudo xcodebuild -license accept

## Sign in to AppleID

## Setup Github ssh
Login Github

https://help.github.com/en/articles/adding-a-new-ssh-key-to-your-github-account

```bash
git config --global color.ui true
git config --global user.name "TruongNM"
git config --global user.email "truongnmt.dev@gmail.com"
ssh-keygen -t rsa -C "truongnmt.dev@gmail.com"

cat ~/.ssh/id_rsa.pub
# Copy and paste the newly generated SSH key and add it to your Github account: https://github.com/settings/ssh"
  
ssh -T git@github.com
```

## Initial script

```
# Intel chip
chmod +x install.sh
./install.sh

# M1 ARM chip
chmod +x m1_install.sh
./m1_install.sh
```

## Manually setup
- Keyboard
  - Key Repeat: Fast, Delay: Short
  - Use F1, F2 as function key
  - Press Global: do nothing
  - Shortcut -> Keyboard: Move focus to next windows: cmd + `
  - Shortcut -> Input Sources: Select next source in Input menu: cmd + shift + 2
  - OpenKey shortcut: cmd + shift + 1
  - Modifier: Caps -> Ctrl
- Dock
  - Automatically hide and show the Dock
  - Size -> drag it smaller
  - Clock -> display second
- Add internet accounts
- Trackpad
  - Click: light
  - Tap to click
  - Tracking speed: fast
  - More Gesture: App Expose
- Accessibility
  - Display: Reduce motion
  - Pointer -> Pointer Size
- Download XCode (it's download take very long time so we won't using `mas`)
- Iterm2: Pref -> General -> Load preferences from a custom folder or URL: select folder to dotfiles/iterms
- Karabiner: Complex modifications: change right_command+hjkl to arrow keys
- Add license for Contexts
- Login to Visual Studio Code
  - F1 -> Shell command, install `code` to PATH

## Setting VSC
- Install SettingSync extension (native feature comming soon)
- GistID: 718de1083bdf2997084c71e5958ac9ec
