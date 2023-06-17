# must be before p10k instant prompt
if $(command -v fortune >/dev/null); then
	cols=$(tput cols)
	fortune -e "$FORPATH/my-collected-quotes" | fold -s -w "$cols"
	echo
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.zplug/init.zsh

# Plugins
#source $ZDOTDIR/plugins.zplug

# local
#zplug "$ZDOTDIR/aliases", from:local, use:"*.zsh"
for file in "$ZDOTDIR"/aliases/*.zsh; do source "$file"; done
for file in "$ZDOTDIR"/functions/*.zsh; do source "$file"; done

# Install plugins if there are plugins that have not been installed
if ! zplug check; then # --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load #--verbose

# Load and initialise completion system
autoload -Uz compinit
compinit

# keybinds
bindkey '^ ' autosuggest-accept

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
