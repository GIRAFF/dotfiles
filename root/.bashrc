# .bashrc

# User specific aliases and functions

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# enable bash completion in interactive shells
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi

#PS1='\[\e[1;34m\][\u@\h \W]\$\[\e[0m\] '
#Black       0;30     Dark Gray     1;30
#Blue        0;34     Light Blue    1;34
#Green       0;32     Light Green   1;32
#Cyan        0;36     Light Cyan    1;36
#Red         0;31     Light Red     1;31
#Purple      0;35     Light Purple  1;35
#Brown       0;33     Yellow        1;33
#Light Gray  0;37     White         1;37

PS1='\[\e[0;31m\][\[\e[1;31m\]\u@\h \[\e[0;37m\]\W\[\e[0;31m\]]\[\e[1;31m\]#\[\e[0m\] '

#di = directory
#fi = file
#ln = symbolic link
#pi = fifo file
#so = socket file
#bd = block (buffered) special file
#cd = character (unbuffered) special file
#or = symbolic link pointing to a non-existent file (orphan)
#mi = non-existent file pointed to by a symbolic link (visible when you type ls -l)
#ex = file which is executable (ie. has 'x' set in permissions).
#0   = default colour
#1   = bold
#4   = underlined
#5   = flashing text
#7   = reverse field
#31  = red
#32  = green
#33  = orange
#34  = blue
#35  = purple
#36  = cyan
#37  = grey
#40  = black background
#41  = red background
#42  = green background
#43  = orange background
#44  = blue background
#45  = purple background
#46  = cyan background
#47  = grey background
#90  = dark grey
#91  = light red
#92  = light green
#93  = yellow
#94  = light blue
#95  = light purple
#96  = turquoise
#100 = dark grey background
#101 = light red background
#102 = light green background
#103 = yellow background
#104 = light blue background
#105 = light purple background
#106 = turquoise background

alias ls='ls --color -pBc'
alias wingame='env WINEPREFIX=/home/giraff/games/.prefix'
alias gdb='gdb -q'
alias hexographer='java -jar /home/giraff/progs/hexographer.jar'
alias randci='git commit -m "$(curl http://whatthecommit.com/index.txt)"'
#alias rake='rake2.2'

export LS_COLORS="di=1:fi=0:ln=1;34:pi=5:so=5:bd=5:cd=5:or=1;31:mi=0:ex=1;35:*.rpm=90"
export TERM="xterm-256color"

export QSYS_ROOTDIR="/home/giraff/progs/quartus/quartus/sopc_builder/bin"
export ALTERAOCLSDKROOT="/home/giraff/progs/quartus/hld"
export HISTSIZE=1000
export LUNAFW_HOME="/home/giraff/cpp/winter/dir/luna_fw"
