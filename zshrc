# Add to ~/.zshrc
# Alias sfun cd or sfun lcd to show function
alias sfun='typeset -f'
alias bk='cd $OLDPWD'

DIR_FILE=/Users/<home_dir>/.dir_list
DIR_FILE_TEMP=/Users/<home_dir>/.dir_list_temp
DIR_LIST_COUNT=10
touch $DIR_FILE

cd () {
  builtin cd $1
  echo "$(pwd)" | cat - $DIR_FILE | head -n$DIR_LIST_COUNT | awk '!x[$0]++' > dir_list_temp && mv dir_list_temp $DIR_FILE
}

lcd () {
  if [ -z "$1" ]; then
    cat -n $DIR_FILE
  else
    cd "$(sed -n ${1}p $DIR_FILE)"
  fi
}
