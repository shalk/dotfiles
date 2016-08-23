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
    if [ -L $HOME/.$item ]
    then
      echo "[ERROR] backup_dotfile: look like you have link this file $HOME/.$item " >&2
      return 2
    else
      mv $HOME/.$item  $HOME/.${item}.local
    fi
  else 
    echo "[ERROR] backup_dotfile: $HOME/.$item not exists !" >&2
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
  source="$HOME/.${item}.local"
  dest="$HOME/.$item"
  # need source is a normal file or directory
  if [ -f $source ] || [ -d $source ] 
  then
    if [ ! -L $source ]
    then
      /bin/rm -f  "$dest"
      /bin/mv "$source" "$dest"
      return 
    else
      echo "[ERROR] revert_dotfile :$HOME/.$item.local is a link file "
    fi
  else 
    echo "[ERROR] revert_dotfile :$HOME/.$item.local not exists ;can not revert "
    return 2
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
#    item="bashrc"
    for ignore_file in ${ignore_list[@]}
    do
      if test $item == $ignore_file
      then
        continue 2
      fi
    done
    local source="$HOME/.$item" 
    _revert_dotfile $item || true
    _backup_dotfile  $item && _link_dotfile $item
#   break
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
