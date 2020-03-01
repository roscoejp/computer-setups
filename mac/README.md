# Mac Setup

## UI stuff
MacOS setup: https://github.com/mathiasbynens/dotfiles/blob/master/.macos

## References
Start pulling out the good stuff from here: http://sourabhbajaj.com/mac-setup/

Getting started  with dotfiles: https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789

Dotfiles reference repo: https://github.com/webpro/awesome-dotfiles

Mathias dotfiles: https://github.com/mathiasbynens/dotfiles

Holmons dotfiles: https://github.com/holman/dotfiles

Useing Stow for manging symlinks: http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html

## Apps
  - Chrome
  - Chrome Remote Desktop
  - Sensible Side Buttons: https://formulae.brew.sh/cask/sensiblesidebuttons
  - Rectangle: https://github.com/rxhanson/Rectangle

  - Homebrew
    - wget
    - glances or htop
    - nmap
    - openssl
  - iterm2
  ~~- zsh~~
  - VSCode
    - Flake8 python linter
    - Docker
    - Live Server
    - Live Share
    - Material Icon theme
    - Powershell
    - Python
    - Ruby
    - SSH FS
    - Terraform
    - VSCode Ruby
    - vscode-icons
    - YAML
  - Python
    - Pip
    - Pyenv
    - Virtual env
  - Docker
  - iPython
  
## Logrotate bash history but keep last N lines
TLDR: https://kowalcj0.github.io/posts/2019/logrotate-bash-history/

Logrotate: https://formulae.brew.sh/formula/logrotate

in /etc/logrotate.d/bashhistory...
```bash
/home/$USERNAME/.bash_history {
  weekly
  missingok
  rotate 5
  size 5000k
  nomail
  notifempty
  create 600 $USERNAME $USERNAME
  postrotate
    tail -n100 $1 > /home/$USERNAME/.bash_history;
    mkdir -p /home/$USERNAME/bash_history
    mv $1 /home/$USERNAME/bash_history/$1
  endscript
}
```

## Hiding Users
From: https://support.apple.com/en-us/HT203998
```bash
sudo dscl . create /Users/hiddenuser IsHidden 1
```
Hide Home Dir/Share Point
```bash
sudo mv /Users/hiddenuser /var/hiddenuser
sudo dscl . create /Users/hiddenuser NFSHomeDirectory /var/hiddenuser
sudo dscl . delete "/SharePoints/Hidden User's Public Folder"
```
