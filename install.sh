#!/usr/bin/env bash
# Summary: install my dotfile to env
# Usage: install.sh 
set -e
[ -n "$DOTFILE_DEBUG" ]  && set -x 

tmppwd=`pwd`

cd `dirname $0`
ignore_list=("README.md" "install.sh" )
_backup_dotfile(){
  local item=$1
  if [ -z "$item" ]
  then
    echo "_backup_dotfile paramter is null" >&2
    return 1
  fi
  if [ -f $HOME/.$item ] || [ -d $HOME/.$item ]
  then
    mv $HOME/.$item  $HOME/.${item}.local
  elif [ -L $HOME/.$item ]
  then
    echo "look like you have link this file"
    return 2
  else 
    echo "$HOME/.$item not exists !" >&2
    return 3
  fi
  return 
}

_link_dotfile(){
  local item=$1
  if [ -z "$item" ]
  then
    return 1
  fi
  local current_file=`pwd`/$item
  ln -s $current_file  $HOME/.$item
  return 
}
_revert_dotfile(){
  local item=$1
  if [ -z "$item" ]
  then
    return 1
  fi
  if [ -L $HOME/.$item ]
  then
    if [ -f $HOME/.$item.local ] || [ -d $HOME/.$item.local ]
    then
      rm -f  "$HOME/.$item"
      mv $HOME/.${item}.local $HOME/.$item
      return 
    else 
      echo "$HOME/.$item.local not exists ;can not revert "
      return 2
    fi
  else
    echo "$HOME/.$item is not a link for my dotfile" >&2
    return 1
  fi
}
revert(){
  for item in `ls`
  do
    for ignore_file in ${ignore_list[@]}
    do
      if test $item == $ignore_file
      then
        continue 2
      fi
    done
    local source="$HOME/.$item" 
    _revert_dotfile $item || true
  done  
}

main(){
  for item in `ls`
  do
    for ignore_file in ${ignore_list[@]}
    do
      if test $item == $ignore_file
      then
        continue 2
      fi
    done
    local source="$HOME/.$item" 
    _backup_dotfile  $item && _link_dotfile $item

  done  
}
usage(){
  echo "Usage :
  install.sh [OPTION]
    
  install dotfile to system

  Option:
  --uninstall  revert dotfile
  -h| --help   Usage
  " 
}
if [ X"$1" == X"--uninstall" ] ||  [ X"$1" == X"-u" ]
then
  revert   
elif [ X"$1" == X"--help" ] || [ X"$1" == X"-h" ] 
then
  usage
else
  main
fi
