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

PROMPT_COMMAND='history -a'
HISTCONTROL='ignoredups'

set_ip () {
  wifi=$(ip | grep 'Wi-Fi') # get specific line
  output=$(echo $wifi | sed 's/\x1b\[[0-9;]*m//g') # strip color codes
  ip=$(echo $output | sed 's/.*\s//') # parse ip address

  react_native_packager_hostname=$ip
  export react_native_packager_hostname

  echo $wifi
}

# cp .bashrc ~ 
# when done editing
