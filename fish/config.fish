#!/bin/bash
if status is-interactive
# Commands to run in interactive sessions can go here
end

thefuck --alias | source
atuin init fish --disable-up-arrow | source
#atuin init fish --disable-ctrl-r --disable-up-arrow | source

alias svim="sudo -e vim"
alias ovim="/usr/bin/vim"
alias vim="nvim"
alias nano="nvim"
function get
    set -l n $argv[1]
    awk "{print \$$n}"
end

alias fmod="vim ~/.fishrc"
alias fview="bat ~/.fishrc"
alias imod="vim ~/.i3rc"
alias iview="bat ~/.i3rc"
alias tmod="vim ~/.tmuxrc"
alias tview="bat ~/.tmuxrc"
alias umux="~/.config/tmux/tmux_github_sync.sh"
alias cnv="cd ~/.config/nvim ; nvim ."
alias vmod="cd ~/.config/nvim ; nvim ."
alias nmod="cd ~/.config/nvim ; nvim ."
alias cn="cd ~/.config/nvim"


alias lp="lsblk -o +PARTLABEL"
alias listpartitions="lsblk -o +PARTLABEL"
alias listblocks="lsblk -o +PARTLABEL"
alias lsblk1="lsblk -o +PARTLABEL"

alias reload="source ~/.config/fish/config.fish"
alias r="source ~/.config/fish/config.fish"
alias pk="polykill"
alias cl="clear"
alias en="echo -n"
alias theme="kitty +kitten themes"

alias updatelocate="sudo updatedb"

function package_finder
echo "Changing shell to Bash..."
sudo chsh -s /bin/bash

echo "Running fpf -a..."
fpf -a

echo "Changing shell back to Fish..."
sudo chsh -s /bin/fish
end
#this is a fuzzy package finder


alias findpackage="package_finder"
alias find_package="package_finder"

alias findr="sudo find / -name "
alias findi="sudo find / -lname "
#alias sudo nano="svim"
function findc
find . -iname "*$argv*"
end



function fzfv
vim (fzf -m --preview='bat --color=always {}')
end


function fzfp
# Get the current directory
set image_dir (pwd)

# Select an image using fzf with preview
set selected_image (find $image_dir -type f -name '*.jpg' -o -name '*.jpeg' -o -name '*.png' | fzf --preview='feh --preload {}' --preview-window=right:50%:wrap)

# Pipe the selected image into command 'c'
if test -n "$selected_image"
	echo $selected_image | c
end
end

function fzfc
fzf -m --preview='feh {}' | c 
end

alias pythonvenv="/home/francois/MainPython_Virtual_Environment/.venv/bin/python"
alias pv="pythonvenv"

function govenv
source /home/francois/MainPython_Virtual_Environment/.venv/bin/activate.fish
end


alias searchdir="rg --files | fzf"
alias sdir="searchdir"

function pvp1
echo "Control+Shift+p Python: Select Interpreter, Enter Interpreter path"
echo -n "/home/francois/MainPython_Virtual_Environment/.venv/bin/python" | c 
echo "The path of the python interpreter is now inside your clipboard. Just Control v it"
end


#alias leavevenv="deactivate"
alias lvenv="deactivate"
alias quitvenv="deactivate"


alias urlisten="sudo tcpdump -i wlan0 -n tcp port 80 or tcp port 443"
alias iplisten="sudo iftop"
alias inl="sudo nethogs wlan0"
alias ist="govenv ; speedtest-cli ;lvenv"
#internet network listen


#alias cd="z"
# might break stuff idk. i'll keep it for now
alias v="z"
alias eva="eza"
alias ls="eza"
alias ll='eza -alf'
alias la='eza -a'
alias l='eza -cf'
alias lsdir='ls -d */'

alias ch='cd ~'
alias cr="cd ~/.config/rofi"
alias cm="cd ~/Music"
alias cP="cd ~/.config/polybar.old/"
alias cdoc="cd ~/Documents"
alias cdo="cd ~/Downloads"
alias cco="cd ~/.config"
alias ct="cd ~/.local/share/Trash/files"
alias ctm="cd ~/.config/tmux"

alias kmux="tmux kill-server"
alias lmux="tmux detach"
alias dmux="tmus detach"
alias qmux="tmux kill-session"
alias jmux="tmux kill-session"


function tswap
    set -l pane1 $argv[1]
    set -l pane2 $argv[2]

    tmux swap-pane -s $pane1 -t $pane2
end




function comparehash_md5
    set file "$argv[1]"
    set expected_hash "$argv[2]"

    set actual_hash (md5sum "$file" | awk '{print $1}')

    if test "$actual_hash" = "$expected_hash"
        echo "Hashes match: $actual_hash"
    else
        echo "Hashes do not match:"
		echo "Actual hash:   $actual_hash"
        echo "Expected hash: $expected_hash"
    end
end


function comparehash_sha
    set file "$argv[1]"
    set expected_hash "$argv[2]"

    set actual_hash (sha256sum "$file" | awk '{print $1}')

    if test "$actual_hash" = "$expected_hash"
        echo "Hashes match: $actual_hash"
    else
        echo "Hashes do not match:"
		echo "Actual hash:   $actual_hash"
        echo "Expected hash: $expected_hash"
    end
end



alias sp="sudo pacman -S"
alias yp="yay -S"

alias c="xclip -sel c"
alias copy="c"
alias pwc="echo -n (pwd) | c"
alias paste="xclip -selection clipboard -o"
alias p="paste"
alias prevc="history --max=1 | c"






function ndiff
    if test (count $argv) -ne 2
        echo "Usage: nrdiff file1 file2"
        return 1
    end
    diff --color $argv[1] $argv[2] | diff-so-fancy | bat
end


function bdiff
    if test (count $argv) -ne 2
        echo "Usage: ndiff file1 file2"
        return 1
    end
    git diff --no-index --color $argv[1] $argv[2] | diff-so-fancy | bat
end


source /usr/share/autojump/autojump.fish
zoxide init fish | source





# Change working dir in fish to last dir in lf on exit (adapted from ranger).
#
# You may put this file to a directory in $fish_function_path variable:
#
#     mkdir -p ~/.config/fish/functions
#     ln -s "/path/to/lfcd.fish" ~/.config/fish/functions
#
# You may also like to assign a key (Ctrl-O) to this command:
#
 bind \cf 'set old_tty (stty -g); stty sane; lfcd; stty $old_tty; commandline -f repaint'
#
# You may put this in a function called fish_user_key_bindings.

function lfcd --wraps="lf" --description="lf - Terminal file manager (changing directory on exit)"
    # `command` is needed in case `lfcd` is aliased to `lf`.
    # Quotes will cause `cd` to not change directory if `lf` prints nothing to stdout due to an error.
    cd "$(command lf -print-last-dir $argv)"
end

alias lf="lfcd"

#alias less="bat --color=always --paging=always"



#to get logisim-evolution working without actually installing a package. 
export PATH="/home/francois/Documents/Linux Documents/University (real):$PATH"
alias "logism=/opt/logisim-evolution/bin/logisim-evolution"
alias "logisim=/opt/logisim-evolution/bin/logisim-evolution"

alias "mars=java -jar \"/home/francois/Documents/Linux Documents/University (real)/Semester 7/COMP 273/MARS.jar\""

alias "MARS=java -jar \"/home/francois/Documents/Linux Documents/University (real)/Semester 7/COMP 273/MARS.jar\""
alias "journal=xournalpp"
alias "xournal=xournalpp"
alias "notebook=xournalpp"
alias "paper=xournalpp"
alias "note=xournalpp"

#alias "logout=wlogout"


export PATH="$HOME:$PATH"
export PATH="$HOME/QolScripts:$PATH"
export PATH="$HOME/Network:$PATH"
export PATH="$HOME/Pictures:$PATH"
export PATH="/home/francois/Videos/i3-video-wallpaper-main/:$PATH"
export PATH="/home/francois/go/bin:$PATH"
export PATH="$HOME/.config/rofi/scripts:$PATH"
export PATH="$HOME/.config/rofi/applets/bin:$PATH"
export PATH="$HOME/.config/tmux:$PATH"

export PATH="/home/francois/Music:$PATH"
export PATH="/home/francois/Videos/Animated_Background/:$PATH"
export PATH="/home/francois/Pictures/Slideshow_Scripts/Utils:$PATH"
export PATH="/home/francois/Pictures/Slideshow_Scripts/Master:$PATH"
export PATH="/home/francois/Pictures/Slideshow_Scripts/Parent:$PATH"
export PATH="/home/francois/miniconda3/bin:$PATH"




export PATH="/home/francois/.config/conky:$PATH"

export PATH="/home/francois/.config/polybar.old/:$PATH"
export PATH="/home/francois/.config/polybar/:$PATH"

alias convert_folder="./update_slideshow_files"
alias update_slideshow="./update_slideshow_files"
#alias update_background="update_slideshow_files"


export TERMINAL=kitty
export EDITOR=vim



function fish_greeting
	clear
	#fortune | cowsay -f dragon
	#-o is for offensive/spicier
end



# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#if test -f /home/francois/miniconda3/bin/conda
#    eval /home/francois/miniconda3/bin/conda "shell.fish" "hook" $argv | source
#else
#    if test -f "/home/francois/miniconda3/etc/fish/conf.d/conda.fish"
#        . "/home/francois/miniconda3/etc/fish/conf.d/conda.fish"
#    else
#        set -x PATH "/home/francois/miniconda3/bin" $PATH
#    end
#end
# <<< conda initialize <<<
#conda activate venv


# Function to activate Conda environments
function conda_activate
    set conda_path "/home/francois/miniconda3/bin/conda"
    if test -x $conda_path
        eval $conda_path "shell.fish" "hook" $argv | source
		conda activate venv
    else
        echo "Error: Conda not found at $conda_path"
    end
end


alias set_private="/home/francois/.local/share/private/local/settings/set_private.sh"
alias set_public="/home/francois/.local/share/private/local/settings/set_public.sh"
