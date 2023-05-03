#!/bin/bash

SNOW_VER=1.2.17

if [[ $OSTYPE == 'darwin'* ]]; then
  # Install helix editor
  brew install helix
  brew install kubectl 
  brew install --cask snowflake-snowsql
  # Print system information in cli . Use case [ neofetch ]
  brew install neofetch
  # For printing banner style output in command line alternative [ banner <text> ] 
  brew install figlet
  # Install ubuntu like tree command
  brew install tree
  # Install watch command in Mac . Use case [ watch {command} ]
  brew install watch
  # Install Podman
  brew install podman
  # Install minikube
  brew install minikube
  brew unlink minikube
  brew link minikube
else
  ####### For now only tested with Ubuntu >= 16.04 and ubutnu in wsl2 #####
  # Install helix editor
  sudo add-apt-repository ppa:maveonair/helix-editor
  sudo apt update
  sudo apt install helix
  # Install python pip
  sudo apt-get update -y
  sudo apt install python3-pip -y
  # Print system information in cli . Use case [ neofetch ]
  sudo apt-get install neofetch
  # For printing banner style output in command line alternative [ banner <text> ] 
  sudo apt-get install figlet
  # Install zsh
  rm -rf $HOME/.oh-my-zsh
  sudo apt install zsh -y
  ## Add zsh to /etc/shells:
  command -v zsh | sudo tee -a /etc/shells
  ## Use chsh to set zsh as default shell:
  sudo chsh -s "$(command -v zsh)" "${USER}"
  ## Install kubectl
  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
  curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
  echo "$(<kubectl.sha256) kubectl" | sha256sum --check
  sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
  chmod +x kubectl
  mkdir -p ~/.local/bin/kubectl
  mv ./kubectl ~/.local/bin/kubectl
  ## Install snowsql
  curl -O https://sfc-repo.snowflakecomputing.com/snowsql/bootstrap/1.2/linux_x86_64/snowsql-${SNOW_VER}-linux_x86_64.bash
  mv snowsql-${SNOW_VER}-linux_x86_64.bash snowsql-linux_x86_64.bash
  chmod 777 snowsql-linux_x86_64.bash
  SNOWSQL_DEST=~/bin SNOWSQL_LOGIN_SHELL=~/.profile bash snowsql-linux_x86_64.bash
  rm -f snowsql-linux_x86_64.bash
  # Configure python cli argument completion
  python3 -m pip install argcomplete
  activate-global-python-argcomplete
  # Install Podman
  sudo apt-get -y install containernetworking-plugins
  sudo apt-get -y install podman
  # Install minikube
fi

# Install ZSH specific tools, themes and plugins
rm -rf ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
rm -rf ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
rm -rf ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions

# Install starship prompt
curl -sS https://starship.rs/install.sh | sh

# tmux plugin installation
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# install istioctl for istio contril in kubernetes cluster [ https://istio.io/latest/docs/ops/diagnostic-tools/istioctl/ ]
curl -sL https://istio.io/downloadIstioctl | sh -

# graphical python terminal
python3 -m pip install ptpython

# configure zsh console
cp .zshrc ${HOME}/.zshrc

# configure python startup file/process. Only executes before python REPL
cp .pythonstartup ${HOME}/.pythonstartup

# Configure vim for development
cp .vimrc ${HOME}/.vimrc

# Tmux plugin manager install [ https://github.com/tmux-plugins/tpm ]
sudo rm -rf ~/.tmux/plugins/*
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Set prmissions for the files
chmod +x ${HOME}/.zshrc
chmod +x ${HOME}/.pythonstartup
chmod +x ${HOME}/.tmux.conf

tmux source ~/.tmux.conf

echo "Setup Completed"
