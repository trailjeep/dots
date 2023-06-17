
# encrypt/decrypt strings compatible w/dokuwiki plugin encrypted passwords
encstr() { echo "$1" | openssl aes-256-cbc -pbkdf2 -e -k "$2" | openssl base64 -e; }
decstr() { echo "$1" | openssl base64 -d | openssl aes-256-cbc -pbkdf2 -d -k "$2"; }
encfl() { openssl aes-256-cbc -pbkdf2 -e -k "$2" -in "$1" -out "$1".dat; }
decfl() ( openssl aes-256-cbc -pbkdf2 -d -k "$2" -in "$1" -out ${1%.dat}; )
encdir() ( tar cz "$1" | openssl aes-256-cbc -pbkdf2 -e -k "$2" -out ${1%/}.dat; )
decdir() { openssl aes-256-cbc -pbkdf2 -d -k "$2" -in "$1" | tar xz; }

# erase sensitive info fr/history
rmhist() {
	[ "$1" = "" ] && { echo "Must specify a pattern!"; return 1; }
	i=`history | grep -c "$1"`
	[ "$i" -eq 1 ] && { echo "No matches found!"; history -d $((HISTCMD-1)); return 0; }
	echo -n "Found $i matches. Removing entry #'s: "
	until [ "$i" -eq 0 ]; do
		n=`history | grep -m 1 "$1" | awk '{print $1}'`
		history -d "$n"
		echo -n "$n "
		((--i))
	done
	history -w
}

rot() {
	# rot 13 + rot 5 = rot 18 | rot 135:q
	tr 'A-Za-z0-9' 'N-ZA-Mn-za-m5-90-4' <<< "$1"
}

# Check website status code
chksite() {curl -Is -K HEAD "$1" | head -1}

function history() {
	num=${1:=1}
	[[ "$num" = 1 ]] && builtin history 1 -1 || builtin history -"$num" -1
}

cd() { builtin cd "$@" && ll }
mnt() { mount | awk '$1 ~ /\/dev/ { print $1,$3; }' | column -t | sort ; }

# backup file
bup() { cp -a "$1" "$1.`date +%s`.ORG"; }

color() {
        local fgc bgc vals seq0
        printf "Color escapes are %s\n" '\e[${value};...;${value}m'
        printf "Values 30..37 are \e[33mforeground colors\e[m\n"
        printf "Values 40..47 are \e[43mbackground colors\e[m\n"
        printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"
        # foreground colors
        for fgc in {30..37}; do
                # background colors
                for bgc in {40..47}; do
                        fgc=${fgc#37} # white
                        bgc=${bgc#40} # black
                        vals="${fgc:+$fgc;}${bgc}"
                        vals=${vals%%;}
                        seq0="${vals:+\e[${vals}m}"
                        printf "  %-9s" "${seq0:-(default)}"
                        printf " ${seq0}TEXT\e[m"
                        printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
                done
                echo; echo
        done
}

