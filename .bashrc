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

alias spblock='pm2 start /d/dev/_personal/spotify-blocker/src/index.js'

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

alias ffmpeg='/d/port/ffmpeg-4.3-win64-static/bin/ffmpeg'

ffmerge() {
  ffmpeg -i $1 -c copy -bsf:v h264_mp4toannexb -f mpegts intermediate1.ts
  ffmpeg -i $2 -c copy -bsf:v h264_mp4toannexb -f mpegts intermediate2.ts
  ffmpeg -i "concat:intermediate1.ts|intermediate2.ts" -c copy -bsf:a aac_adtstoasc output.mp4
  
  rm intermediate1.ts intermediate2.ts
}

# k8s functions

ke() {
  kubectl exec -it $1 powershell
}

alias az='az.cmd'
alias k='kubectl'

# project specific functions
cppw() {
  cp "D:\dev\_bentley\pwecplugin\out\Winx64\Build\Dms\build\BentleyMasProviderPW\obj\PWWSGPluginInstaller\BentleyWSGProjectWisePlugin.msi" \
  "D:\dev\_bentley\ProjectWiseLancaster\di-container\bin\plugin"
}

# cp scripts/.bashrc ~
# when done editing
