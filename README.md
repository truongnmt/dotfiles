## Setup XCode first and agree to license
sudo xcodebuild -license accept

## Setup Github ssh
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
chmod +x install.sh
./install.sh
```

## Setting VSC
- Install SettingSync extension (native feature comming soon)
- GistID: 718de1083bdf2997084c71e5958ac9ec

## Setup email

## Browser sync
