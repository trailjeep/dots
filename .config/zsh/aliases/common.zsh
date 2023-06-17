
alias clip='xclip' # ->xclipboard
alias clop='xclip -o' # xclipboard->

# grep ignore case & color
alias egrep='egrep -i --color=auto'
alias fgrep='fgrep -i --color=auto'
alias grep='grep -i --color=auto'

alias diff='diff --color=auto -u0'

# ls
#if ! (( $+commands[exa] )); then
if $(command -v exa >/dev/null 2>&1); then
	if exa --version | grep -q '+git'; then
		alias ls='exa --group --links --icons --classify --color=auto --sort=name --group-directories-first --git'
		alias ll='exa --long --group --links --icons --classify --color=auto --all --sort=name --group-directories-first --time=modified --time-style=long-iso --extended --git'
		alias tree='ll --tree --level=2'
	else
		alias ls='exa --group --links --icons --classify --color=auto --sort=name --group-directories-first'
		alias ll='exa --long --group --links --icons --classify --color=auto --all --sort=name --group-directories-first --time=modified --time-style=long-iso --extended'
		alias tree='ll --tree --level=2'
	fi
else
	alias ll='ls -Falt'
fi

alias wget='wget --continue --content-disposition'

alias cat='bat'

alias locate='locate -i'

alias gunzip='gunzip -k'
alias bunzip2='bunzip2 -k'
alias xz='xz -k'

alias stow='stow -v'	# stow verbose

alias dd='dd status=progress'	# dd progress

alias ifconfig='echo -e "\n** Deprecated: use ip **\n"; ip a'

alias free='free -h'    # free human readable
alias df='df -h'        # disk free human readable
alias du='du -hx'       # disk usage human readable
alias ncdu='ncdu -x'    # do not cross fs boundaries

alias more='less'	# less is more
alias less='less -I' # search ignore case
alias vim='nvim'
alias diff='colordiff'
alias pgrep='pgrep -a'

alias taz='ssh taz'
alias nailah='ssh nailah'
alias maisie='ssh maisie'
alias jax='ssh jax'

alias irc='irssi -n trailjeep -c freenode'

alias podplay='mplayer -af scaletempo -speed 1.5 '	# mplayer play podcasts @1.5x

alias md='mkdir -pv'
alias distro='lsb_release -a'

alias hg='history|grep'
alias cpv='rsync -ah --info=progress2'

# [trash-cli](https://github.com/sindresorhus/trash-cli)
alias rm='trash'

# ANSI colors
alias ansi-colors='for attr in $(seq 0 1); do for fg in $(seq 30 37); do for bg in $(seq 40 47); do printf "\033[$attr;${bg};${fg}m$attr;$fg;$bg\033[m "; done; echo; done; done'

# external ip
if $(command -v dig >/dev/null 2>&1); then
    alias extip='dig +short myip.opendns.com @resolver1.opendns.com'
else
    alias extip=$'nslookup myip.opendns.com resolver1.opendns.com | tail -2 | awk \'{print $2}\''
fi

# weather & moon phase
alias wx='curl "http://wttr.in/06437"'
alias wxc='curl "http://wttr.in/HVN?format=%c+%C+%f\n+%hH+%w+%P\n+%m+%l"'
alias wx1='curl "http://wttr.in/HVN?format=2"'
alias moon='curl "http://wttr.in/moon"'

# logout self
alias lout='loginctl terminate-user `whoami`'

if $(command -v cht.sh >/dev/null 2>&1); then
    alias cht='cht.sh'
    kbd() {
        cht.sh kbd:"$1"
    }
    alias kbdl='find $HOME/.cheat.sh/upstream/keyboard/ -name "*.md" -printf "%f\n" | sed "s/.md//" | grep -v README'
fi

# calc plasmoid
if [[ $XDG_CURRENT_DESKTOP == "KDE" ]]; then
    alias calc='[[ $(pgrep -f calculator) ]] && pkill -f calculator || plasmawindowed org.kde.plasma.calculator &>/dev/null &'
fi


alias musikcube='/bin/konsole --nofork --profile tunes --hide-menubar --hide-tabbar -qwindowtitle musikcube -e musikcube &; disown'
alias pyradio='/bin/konsole --nofork --profile tunes --hide-menubar --hide-tabbar -qwindowtitle pyradio -e pyradio &; disown'
