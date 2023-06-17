# depends: fortune, cowsay
# export COWPATH="$HOME/.local/share/cows"
# export FORPATH="$HOME/.local/share/fortune"
# ? fold vs. fmt ?

dogsay() {
	[[ "$(command -v fortune)" && "$(command -v cowsay)" ]] || return 1
	IFS=" " read -r cows <<< $(cowsay -l | tail -n +2 | tr "\n" " ")
	cow=$(echo "$cows" | tr " " "\n" | shuf -n1)
	fortune -e "$FORPATH" | cowsay -f "$cow"
}

myquotes() {
	[[ "$(command -v fortune)" ]] || return 1
	cols=$(tput cols)
	fortune -e "$FORPATH/my-collected-quotes" | fold -s -w "$cols"
	echo
}
