# zshconfig
configure zsh shell using .zshrc file

## Oh My Zsh installation
Oh My Zsh is an open source, community-driven framework for managing your zsh configuration.
### Basic Installation
Oh My Zsh is installed by running one of the following commands in your terminal. You can install this via the command-line with either curl or wget, whichever is installed on your machine.
. curl or wget should be installed
. git should be installed (recommended v2.4.11 or higher)

via curl
```$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"```
via wget
```$ sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"```

### Uninstalling Oh My Zsh
Oh My Zsh isn't for everyone. We'll miss you, but we want to make this an easy breakup.
If you want to uninstall oh-my-zsh, just run uninstall_oh_my_zsh from the command-line. It will remove itself and revert your previous bash or zsh configuration.

## Theme installation

### 1. powerlevel10k
To install this theme for use in Oh-My-Zsh, clone this repository into your OMZ custom/themes directory.
```$ git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k```

You then need to select this theme in your ~/.zshrc:
```ZSH_THEME="powerlevel10k/powerlevel10k"```
