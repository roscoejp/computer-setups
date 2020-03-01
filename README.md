# Windows Setup
```powershell
Set-ExecutionPolicy RemoteSigned
.\bootstrap.ps1
```

- Run chocolatey-installs.ps1 to install chocolatey and other basic packages
- Import Classic Shell settings
- Display settings for smaller text
- Display settings to enable Night light

# Linux Setup
```bash
./bootstrap.sh
```

- Gnome Tweak Tools
- Gnome extensions
  - Dash to dock (or dock to dash, can't remember which one)
  - extensions in panel
  - Music player in panel

# Mac Setup
```bash
./bootstrap.sh
```

I was directed to a great [macOS Setup Guide](http://sourabhbajaj.com/mac-setup/) back in 2016 after a MacBook Air died and I had no way of recovering all of my settings and tweaks after a few good years of use. This guide is good, but it doesn't actually automate many things. Enter [Dotfiles](https://github.com/webpro/awesome-dotfiles) and all of it's splendor, and now I have something to keep me occupied in my spare time.

- I like [Holman's dotfiles](https://github.com/holman/dotfiles) project so I'm taking most of my queues from there.
- I also like the simplicity of [using Stow for managing symlinks](http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html) so I'm trying to see if I can use this for managing configs.
- I also cannot claim much originality when it comes to figuring out MAC terminal commands for common UI changes, so credit to [Mathias' excellent MAC setup script](https://github.com/mathiasbynens/dotfiles/blob/master/.macos) which I have modded for my own use.

## High Level
- Things that can be configured = topics
- Things that can be installed via homebrew and don't have configs = brewfile
- Things that can't be homebrewed = topic/install.sh
- All installs should check if apps are already installed (should be idempotent)
- Put stuff into the brewfile first to see if it configs using dotfiles. If it does move it into a topic.

## Logrotate bash history but keep last N lines
TLDR: https://kowalcj0.github.io/posts/2019/logrotate-bash-history/
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

## Things to install
- Xcode
- Homebrew
- Firefox
  - Move userchrome.css to right dir
- [Stow](https://formulae.brew.sh/formula/stow)
- iTerm2
  - Zsh - installed by default on new Mac but still will want to configure
  - tree
- Git
- Bash Completion
- VSCode
  - Plugins:
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
  - Some way of keeping plugins up to date?
- Python
  - pyenv
    - pyenv-virtualenv
  - Pip
  - virtualenv
  - IPython
- MySQL
- Ruby
  - rbenv
  - RubyGems
- Vagrant
- [Docker](https://formulae.brew.sh/cask/docker)
  - ```bash
    brew install bash-completion
    brew install docker-completion
    brew install docker-compose-completion
    brew install docker-machine-completion
    ```
- Chrome
  - Chrome Remote Desktop
- [Google Drive backup](https://formulae.brew.sh/cask/google-backup-and-sync)
- [GCloud](https://formulae.brew.sh/cask/google-cloud-sdk)
- Terraform
  - [tfenv](https://formulae.brew.sh/formula/tfenv)
  - [terraform-docs](https://formulae.brew.sh/formula/terraform-docs)
  - [terragrunt](https://formulae.brew.sh/formula/terragrunt)
- Kubernetes
  - [kubectl](https://formulae.brew.sh/formula/kubernetes-cli)
  - [kubectx](https://formulae.brew.sh/formula/kubectx)
  - [Helm](https://formulae.brew.sh/formula/helm)
- [Ansible](https://formulae.brew.sh/formula/ansible)
- [Sensible Side Buttons](https://formulae.brew.sh/cask/sensiblesidebuttons)
- [Rectangle](https://formulae.brew.sh/cask/rectangle)
- NMap
- [Logrotate](https://formulae.brew.sh/formula/logrotate)
- Slack
- Microsoft Teams

### Are these preinstalled on modern MacOS?
  - wget
  - glances or htop
  - openssl
