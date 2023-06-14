# Dotfiles!

## Config

### Aliases
```
alias dotgit='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'                                              
alias dg='dotgit'
alias dga='dotgit add'
alias dgc='dotgit commit -a --allow-empty-message --no-edit'
alias dgls='dotgit ls-tree -r HEAD --name-only'
alias dgrm='dotgit rm --cached'
alias dgs='dotgit status'
alias dgp='dotgit push -u origin main'
```

### Initialize Repo
```
git init --bare $HOME/.dotfiles
dg config --local status.showUntrackedFiles no
dg remote add origin https://github.com/trailjeep/dotfiles.git
dg branch -M main
```

## Usage

### Add README File
Ref: [About READMEs](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-readmes#about-readmes)
```
mkdir $HOME/.github
vim $HOME/.github/README.md
```

### Add Files
```
dga /path/to/file
```

### Commit
```
dgc
```

### Update
```
dgp
```

## New Machine Setup
To set up a new machine, clone the repo to a temporary directory. This is because you might have some default config files in your $HOME which will cause a normal clone to fail.
```
git clone --separate-git-dir=$HOME/.dotfiles https://github.com/anandpiyer/.dotfiles.git tmpdotfiles
rsync --recursive --verbose --exclude '.git' tmpdotfiles/ $HOME/
rm -r tmpdotfiles
```

