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

#test
export AF_OPENCL_DEFAULT_DEVICE=1

export PATH="$HOME/bin:$HOME/.local/bin:$HOME/.cargo/bin:$HOME/go/bin:$PATH"
# not needed cause symlink vv
# export PATH="$HOME/.local/bin/zen-browser/:$PATH"
