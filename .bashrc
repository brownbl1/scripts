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

# alias cd/back

pushd() {
  if [ $# -eq 0 ]; then
    DIR="${HOME}"
  else
    DIR="$1"
  fi
  
  builtin pushd "${DIR}" > /dev/null
}

pushd_builtin() {
  builtin pushd > /dev/null
}

popd() {
  builtin popd > /dev/null
}

alias cd='pushd'
alias back='popd'
alias flip='pushd_builtin'

# video functions

inject() {
  python /d/port/spatial-media-2.1/spatialmedia -i $1 ${1%.MP4}_inj.mp4
}

inject_dir() {
  for i in $(ls *.MP4)
  do
    inject $i
    rm $i
  done
}

# k8s functions

ke() {
  kubectl exec -it $1 powershell
}

# cp .bashrc ~
# when done editing
