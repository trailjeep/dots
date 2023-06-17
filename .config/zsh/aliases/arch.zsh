# pacman
if $(command -v pacdiff >/dev/null 2>&1); then
	alias pacdiff='eos-pacdiff'
fi

if $(command -v pacman >/dev/null 2>&1); then
        alias pms='pacman -Ss'	# search for pkg
        alias pmq='pacman -Q'	# list installed pkgs
        alias pmf='pacman -F'	# find pkg providing file
        alias pmi='sudo pacman -S'	# install pkg
        alias pmr='sudo pacman -Rns'	# remove pkg + unneeded deps + conf
        alias pmy='sudo pacman -Syy'	# force sync repos
        alias pmu='sudo pacman -Syyuu'	# full system upgrade / enable downgrade
        alias pmd='sudo pacman -Syyuuw --noconfirm'	# just download updates
        alias pmid='sudo pacman -Suu --noconfirm && sudo pacdiff'	# install downloaded
        alias pmo='pacman -Qdt'	# list orphans
        alias pmor='sudo pacman -Rns $(pacman -Qtdq)'	# recursively remove orphans
        alias pmfy='sudo pacman -Fy'	# sync file db
fi
