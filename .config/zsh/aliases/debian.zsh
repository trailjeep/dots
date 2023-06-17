# apt
if $(command -v apt >/dev/null 2>&1); then
	alias upd='sudo apt update'
	alias upg='sudo apt update && sudo apt upgrade'
	alias upgd='sudo apt update && sudo apt full-upgrade'
	alias pkgcln='sudo dpkg --configure -a && sudo dpkg -C && sudo apt install -f && sudo apt autoremove -y && sudo apt autoclean -y && sudo apt -y clean'
fi
