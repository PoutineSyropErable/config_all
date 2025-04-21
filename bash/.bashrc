#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# something about lib32-bulkan-icd-loader optimisation
export RADV_PERFTEST=aco
export TERMINAL=kitty
export EDITOR=nvim
