# systemd
# system runlevel equivs
alias rl0='sudo systemctl isolate poweroff.target'	# poweroff
alias rl1='sudo systemctl isolate rescue.target'	# single user
alias rl3='sudo systemctl isolate multi-user.target'# multi-user / network / no gui
alias rl5='sudo systemctl isolate default.target'	# multi-user / network / gui
alias rl6='sudo systemctl isolate  reboot.target'	# reboot
