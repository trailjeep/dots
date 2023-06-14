# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.zplug/init.zsh

HISTSIZE=5000
#HISTFILE=~/.zsh_history
SAVEHIST=5000
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt incappendhistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Plugins
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting" # before zsh-history-substring-search
zplug "zsh-users/zsh-history-substring-search"                                                                          
zplug "zap-zsh/supercharge"
zplug "zap-zsh/fzf"
zplug "zap-zsh/sudo"
zplug "hlissner/zsh-autopair"
zplug "romkatv/powerlevel10k", as:theme, depth:1
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/isodate", from:oh-my-zsh
zplug "plugins/archlinux", from:oh-my-zsh
zplug "MichaelAquilina/zsh-you-should-use"
zplug "embeddedpenguin/sanekeybinds"

# Sources                                                                       
source $HOME/.config/zsh/aliases
source $HOME/.config/zsh/functions

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
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
