alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gca='git commit --amend'
alias gl='git log --oneline --all --graph --decorate'

gi () {
  git config user.name "Ben Brown"
  git config user.email "itslittlejohn@gmail.com"
  echo 'local git configured'
}

alias ls='ls --show-control-chars -F --color'
alias la='ls -a'

alias e.='explorer .'

alias spblock='forever start ~/cron/sab.json'

# cp .bashrc ~ 
# when done editing
