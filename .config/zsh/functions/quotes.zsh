# depends: fortune, cowsay
# export COWPATH="$HOME/.local/share/cows"
# export FORPATH="$HOME/.local/share/fortune"
# ? fold vs. fmt ?

dogsay() {
	if $(command -v fortune >/dev/null) && $(command -v cowsay >/dev/null); then
		IFS=" " read -r cows <<< $(cowsay -l | tail -n +2 | tr "\n" " ")
		cow=$(echo "$cows" | tr " " "\n" | shuf -n1)
		fortune -e "$FORPATH" | cowsay -f "$cow"
	else
		return 1
	fi
}

myquotes() {
	if $(command -v fortune >/dev/null); then
		cols=$(tput cols)
		fortune -e "$FORPATH/my-collected-quotes" | fold -s -w "$cols"
		echo
	else
		return 1
	fi
}
