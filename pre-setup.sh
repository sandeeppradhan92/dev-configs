pip3 install ptpython
pip3 install argcomplete
activate-global-python-argcomplete

cp .pythonstartup ${HOME}/.pythonstartup

if [[ $OSTYPE == 'darwin'* ]]; then
  brew install --cask snowflake-snowsql
else
  curl -O https://sfc-repo.snowflakecomputing.com/snowsql/bootstrap/1.2/linux_x86_64/snowsql-1.2.17-linux_x86_64.bash
  chmod 777 snowsql-linux_x86_64.bash
  SNOWSQL_DEST=~/bin SNOWSQL_LOGIN_SHELL=~/.profile bash snowsql-linux_x86_64.bash
  rm -f snowsql-linux_x86_64.bash
fi
