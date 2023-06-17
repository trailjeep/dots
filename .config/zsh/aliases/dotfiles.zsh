# Dotfiles                                                                      
alias dotgit='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'        
alias dg='dotgit'                                                               
alias dga='dotgit add'                                                          
alias dgc='dotgit commit -a --allow-empty-message --no-edit'                    
alias dgls='dotgit ls-tree -r HEAD --name-only'                                 
alias dgrm='dotgit rm --cached'                                                 
alias dgs='dotgit status'                                                       
alias dgp='dotgit push -u origin main'
