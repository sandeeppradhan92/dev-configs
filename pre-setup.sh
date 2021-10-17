#!/bin/bash

if [[ $OSTYPE == 'darwin'* ]]; then
  brew install kubectl 
  brew install --cask snowflake-snowsql
else
  ## install zsh
  sudo apt-get update -y
  sudo apt install zsh -y
  ## Add zsh to /etc/shells:
  command -v zsh | sudo tee -a /etc/shells
  ## use chsh to set zsh as default shell:
  sudo chsh -s "$(command -v zsh)" "${USER}"
  ## Install kubectl
  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
  curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
  echo "$(<kubectl.sha256) kubectl" | sha256sum --check
  sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
  chmod +x kubectl
  mkdir -p ~/.local/bin/kubectl
  mv ./kubectl ~/.local/bin/kubectl
  ## install snowsql
  curl -O https://sfc-repo.snowflakecomputing.com/snowsql/bootstrap/1.2/linux_x86_64/snowsql-1.2.17-linux_x86_64.bash
  chmod 777 snowsql-linux_x86_64.bash
  SNOWSQL_DEST=~/bin SNOWSQL_LOGIN_SHELL=~/.profile bash snowsql-linux_x86_64.bash
  rm -f snowsql-linux_x86_64.bash
fi

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

pip3 install ptpython
pip3 install argcomplete
activate-global-python-argcomplete

cp .zshrc ${HOME}/.zshrc
cp .p10k.zsh ${HOME}/.p10k.zsh
cp .pythonstartup ${HOME}/.pythonstartup
