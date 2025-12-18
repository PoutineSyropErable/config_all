# file: ~/.config/tmux-sessionizer/tmux-sessionizer.conf
TS_SESSION_COMMANDS=("$HOME/.config/tmux-sessionizer/cmd0.sh" "$HOME/.config/tmux-sessionizer/cmd1.sh" "bear -- ./build.sh")
TS_DASH_T_COMMANDS=("$HOME/.config/tmux-sessionizer/cmd0t.sh" "$HOME/.config/tmux-sessionizer/cmd1t.sh" "build.sh")

# TS_LOG="notify"

# Replace defaults completely
TS_SEARCH_PATHS=(
	# "$HOME/.config/"

	"$HOME/"
	"$HOME/QolScripts/"
	"$HOME/QolScripts/screen_placer"
	"$HOME/.config/lf"
	"$HOME/.config/hypr"

	"$HOME/.config/eww"
	"$HOME/.config/nvim"
	"$HOME/.config/nvim/meld_like_merge"
	"$HOME/.config/nvim/nvim-possession"
	"$HOME/.config/nvim/scripts/pythonScripts"

	"$HOME/.config/tmux"
	"$HOME/.config/ironbar"
	"$HOME/.config/waybar"
	"$HOME/.config/zsh"
	"$HOME/.config/tmux-sessionizer-config"
	"$HOME/.local/tmux-sessionizer-local"
	"$HOME/Documents/"
	"$HOME/Documents/Books"
	"$HOME/Documents/University (Real)/Semester 10/Comp 303/AutomakeJava"
	"$HOME/Documents/University (Real)/Semester 10/Comp 303/Project/Comp303Project"
	"$HOME/Documents/zzz__PersonalProjects/CppModules/"
	"$HOME/Documents/zzz__PersonalProjects/MapleKernel"
	"$HOME/Documents/zzz__PersonalProjects/MapleKernel/src/"
	"$HOME/Documents/zzz__PersonalProjects/MapleKernel/Tutorials/meaty-skeleton/"
	"$HOME/Documents/zzz__PersonalProjects/MapleKernel/Tutorials/BareBones/"
	"$HOME/Documents/zzz__PersonalProjects/MapleKernel/Tutorials/rawboot/"
	"
"
)

# Optionally add more paths
TS_EXTRA_SEARCH_PATHS=(
	"$HOME/Documents/zzz__PersonalProjects/Learn C And Assembly/modern-c textbook_example_code"

	"$HOME/Documents/zzz__PersonalProjects/Learn C And Assembly/Exercises/:2"
	"$HOME/Documents/zzz__PersonalProjects/Learn C And Assembly/arch1001_x86-64_asm_code_for_class:0"
	"$HOME/Documents/zzz__PersonalProjects/Learn C And Assembly/arch1001_x86-64_asm_slides_and_subtitles:0"
	"$HOME/Documents/zzz__PersonalProjects/Learn C And Assembly/arch2001_x86-64_os_internals_code_for_class:0"
	"$HOME/Documents/zzz__PersonalProjects/Learn C And Assembly/arch2001_x86-64_os_internals_slides_and_subtitles:0"
)

TS_MAX_DEPTH=0

: "${TS_SESSION_COMMANDS[@]}" "${TS_DASH_T_COMMANDS[@]}" "${TS_SEARCH_PATHS[@]}" "${TS_EXTRA_SEARCH_PATHS[@]}" >/dev/null 2>&1
: "$TS_MAX_DEPTH" >/dev/null 2>&1
