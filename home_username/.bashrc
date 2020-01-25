#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [[ -f /usr/share/git/completion/git-prompt.sh ]] ; then
	source /usr/share/git/completion/git-prompt.sh
fi

# custom colored prompt
PROMPT_COMMAND=__prompt_cmd
__prompt_cmd() {
	local EXIT="$?"

	# Terminal Control Escape Sequences: http://www.termsys.demon.co.uk/vtansi.htm
	local RED="\[\e[1;91m\]"
	local GREEN="\[\e[1;92m\]"
	local YELLOW="\[\e[1;93m\]"
	local BLUE="\[\e[1;94m\]"
	local CYAN="\[\e[1;96m\]"
	local DRED="\[\e[0;31m\]"
	local DCYAN="\[\e[0;36m\]"
	local RESET="\[\e[0m\]"

	# green arrow if the last command terminated successfully
	local SUCC_COL=$(if [[ ${UID} -eq "0" ]] ; then echo "${YELLOW}" ; else echo "${GREEN}" ; fi)
	local CODE=$(if [[ ${EXIT} == 0 ]] ; then echo "${SUCC_COL}> " ; else echo "${RED}> " ; fi)

	# it's handy to see if there are any stopped jobs
	local JOBS_COUNT=$(jobs | wc -l)
	local JOBS=$(if [[ ${JOBS_COUNT} > 0 ]] ; then echo "${YELLOW}${JOBS_COUNT} " ; fi)

	# different colors for super- and regular users
	local HOST_COL=$(if [[ ${UID} -eq "0" ]] ; then echo "${DRED}" ; else echo "${DCYAN}" ; fi)
	local PATH_COL=$(if [[ ${UID} -eq "0" ]] ; then echo "${RED}" ; else echo "${CYAN}" ; fi)

	local GIT_DESC="$(git desc 2>/dev/null| head -n1 | tr -d '\n')"
	if [[ "$GIT_DESC" != "" ]] ; then
		local GIT_DESC=" $GIT_DESC"
	fi
	local GIT_PMT=$([[ $(type __git_ps1 2>/dev/null) ]] && __git_ps1 "${CYAN} (${DRED}%s${RED}${GIT_DESC}${CYAN})")
	#local GIT_PMT=$([[ $(type __git_ps1 2>/dev/null) ]] && __git_ps1 "${CYAN} (${RED}%s${CYAN})")

	#PS1="${CODE}${JOBS}${HOST_COL}\u@\h ${PATH_COL}\W${GIT_PMT} ${SUCC_COL}\\$ ${RESET}"
	PS1="${CODE}${JOBS}${HOST_COL}\u@\h ${PATH_COL}\W${GIT_PMT}\n${SUCC_COL}\\$ ${RESET}"
}
PS2="\[\e[1;92m\]>\[\e[0m\] "

# careful resize for terminal emulators
shopt -s checkwinsize

export HISTCONTROL=ignoredups
export HISTSIZE=1000
# append to the history file, don't overwrite it
shopt -s histappend
# man, blue for directories was so lame!
export LS_COLORS="di=1:fi=0:ln=1;34:or=1;31:mi=0:ex=1;35:*.rpm=90"
export TERMINAL=lxterminal

export PATH="$PATH:/home/igor/bin"
export EDITOR=vim

alias ls='ls --color=auto -pBc'
alias ll='ls -l'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias gdb='gdb --quiet'
