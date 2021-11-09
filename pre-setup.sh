#!/bin/bash

SNOW_VER=1.2.17

if [[ $OSTYPE == 'darwin'* ]]; then
  brew install kubectl 
  brew install --cask snowflake-snowsql
  brew install neofetch
else
  ## install python pip
  sudo apt-get update -y
  sudo apt install python3-pip -y
  sudo apt-get install neofetch
  ## install zsh
  rm -rf $HOME/.oh-my-zsh
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
  curl -O https://sfc-repo.snowflakecomputing.com/snowsql/bootstrap/1.2/linux_x86_64/snowsql-${SNOW_VER}-linux_x86_64.bash
  mv snowsql-${SNOW_VER}-linux_x86_64.bash snowsql-linux_x86_64.bash
  chmod 777 snowsql-linux_x86_64.bash
  SNOWSQL_DEST=~/bin SNOWSQL_LOGIN_SHELL=~/.profile bash snowsql-linux_x86_64.bash
  rm -f snowsql-linux_x86_64.bash
  python3 -m pip install argcomplete
  activate-global-python-argcomplete
fi

curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | bash
rm -rf ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
rm -rf ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
rm -rf ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
rm -rf ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions


# install istioctl https://istio.io/latest/docs/ops/diagnostic-tools/istioctl/
curl -sL https://istio.io/downloadIstioctl | sh -

# graphical python terminal
python3 -m pip install ptpython


cp .zshrc ${HOME}/.zshrc
cp .p10k.zsh ${HOME}/.p10k.zsh
cp .pythonstartup ${HOME}/.pythonstartup

chmod +x ${HOME}/.zshrc
chmod +x ${HOME}/.p10k.zsh
chmod +x ${HOME}/.pythonstartup

echo "Setup Completed"
