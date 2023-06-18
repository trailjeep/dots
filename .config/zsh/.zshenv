export ED="/usr/bin/nvim"
export EDITOR="/usr/bin/nvim"
export VISUAL="/usr/bin/nvim"
export SUDO_EDITOR="/usr/bin/nvim"
export TERMINAL="/usr/bin/konsole"
export PAGER="/usr/bin/less"
export BROWSER="/usr/bin/firefox"
export INPUTRC="$HOME/.inputrc"

# ls
export LS_OPTIONS='--color=auto -A -F -X -B -h -v -b -T 0 --group-directories-first --quoting-style=shell-escape --time-style=iso'
# git
export GIT_CONFIG_PARAMETERS="'user.name=$USER@$HOSTNAME'"

# java
# Set all Java apps to use GTK+ font & theme settings (https://wiki.manjaro.org/index.php?title=Set_all_Java_apps_to_use_GTK%2B_font_%26_theme_settings)
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dswing.crossplatformlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel ${_JAVA_OPTIONS}"

export BAT_THEME="Dracula"

# Consistent file dialog under KDE Plasma <https://wiki.archlinux.org/title/Uniform_look_for_Qt_and_GTK_applications#QGtkStyle>
# firefox use kde file chooser
# not working here? use /etc/environment?
# export GTK_USE_PORTAL=1
# export GDK_DEBUG=portals

export COWPATH="$HOME/.local/share/cows"
export FORPATH="$HOME/.local/share/fortune"


# [zplug](https://github.com/zplug/zplug)
export ZPLUG_LOADFILE="$ZDOTDIR/plugins.zplug"

### ZSH plugins
# MichaelAquilina/zsh-you-should-use
export YSU_MESSAGE_POSITION="after"	# before|after
export YSU_MODE=ALL					# BESTMATCH|ALL
# zsh-users/zsh-autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff" #,bg=cyan,bold,underline"
# web-search
ZSH_WEB_SEARCH_ENGINES=(
	reddit	"https://www.reddit.com/search/?q="
	arch	"https://wiki.archlinux.org/index.php?search="
	aur		"https://aur.archlinux.org/packages?K="
	amazon	"https://www.amazon.com/s?k="
)

