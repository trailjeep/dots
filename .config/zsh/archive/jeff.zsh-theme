# Modified from: https://github.com/ohmyzsh/ohmyzsh/wiki/Themes#xiong-chiamiov-plus

PROMPT=$'
%{$fg[yellow]%}┌─%(!.%{$fg[red]%}.%{$fg[green]%})%n%{$fg_bold[yellow]%}@%{$fg[blue]%}%m%{$fg_bold[yellow]%} ❱ %{$fg[magenta]%}%~%{$fg_bold[yellow]%} ❱ $(git_prompt_info)%{$fg[cyan]%}%D{%F %-l:%M:%S%p}%{$reset_color%}\
%{$fg[yellow]%}└─%(?.%{$fg[green]%}.%{$fg[red]%})⮞ %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_bold[yellow]%} ❱ "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
