# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

alias MK="mkdir -p 01-sql 02-code 03-config 04-tomcat 05-redis 06-rabbitmq 07-newsoftware 08-others " 

if [ -e /usr/share/terminfo/x/xterm-256color -a X$TERM == X"xterm" ]; then                                                      
    export TERM='xterm-256color'
fi
