# depends: fortune, cowsay
say() {
	#export COWPATH="$HOME/.local/share/cows"
	#export FORPATH="$HOME/.local/share/fortune"
	IFS=" " read -r cows <<< $(cowsay -l | tail -n +2 | tr "\n" " ")
	cow=$(echo "$cows" | tr " " "\n" | shuf -n1)
	fortune -e "$FORPATH" | cowsay -f "$cow"
}
say
