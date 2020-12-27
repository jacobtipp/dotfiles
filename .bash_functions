function makeenv() {
  echo "export $1=$2" >> ~/.bashrc
}

function nmauto() {
  nmap -sC -sV -oA nmap/$1 $1 &
    nmap -A -T4 -p- -oA nmap/long$1 $1 &
}

function gifmanip(){
  gifsicle --comment “`tr ‘\n’ ‘ ‘ < $1`” < $2 > $3
}

function netscan() {
  nmap -sT -vv -p $1 $2 | grep "open port" | awk -F" " '{ print $NF  }' | xargs -n 1 -I {} -- sh -c 'echo {} $(host {} | rev | cut -d " " -f 1 | rev)'
}

function clip() {
  xclip -in -selection clipboard &>/dev/null
}

function clipout() {
  xclip -selection clipboard -o
}

function cat() {
  if [ -z "$1" ]; then
    command cat | clip
      clipout
  else
    command cat $1 | clip
      command cat $1
      fi
}

# quick gobuster directory search
# example-usage: gobquick 10.10.14.1 /usr/share/wordlists/dirb/small.txt

function gobquick () {
  gobuster dir -r -q -u $1 -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt \
    -x php,html,txt -s 200,204,301,302,307,401,403 -k -t 50
}

function lab () {
  mkdir -p ~/lab/$1 && mkdir -p ~/lab/$1/nmap && \
    cd ~/lab/$1 && tmux new -d -s $1;
}

function project () {
  mkdir -p ~/projects/$1 && cd ~/projects/$1 && tmux new -s $1;
}

# tmux attach
function tmat () {
  tmux attach -t $1
}

function tmk () {
  tmux kill-session -t $1
}

function killport() {
  lsof -i :$1 | awk -F" " 'FNR>1 { print $2  }' | uniq | xargs -n 1 -I {} kill {}
}

#set up python webserver in current working directory

function server () {
  killport 8080 &>/dev/null
    python -m SimpleHTTPServer 8080 &>/dev/null &
}

#complete delete a binary
function purge () {
  sudo apt purge --auto-remove $1
    sudo apt clean
}

# Color man pages
function man() {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}

function extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1     ;;
  *.tar.gz)    tar xzf $1     ;;
  *.bz2)       bunzip2 $1     ;;
  *.rar)       unrar e $1     ;;
  *.gz)        gunzip $1      ;;
  *.tar)       tar xf $1      ;;
  *.tbz2)      tar xjf $1     ;;
  *.tgz)       tar xzf $1     ;;
  *.zip)       unzip $1       ;;
  *.Z)         uncompress $1  ;;
  *.7z)        7z x $1        ;;
  *)     echo "'$1' cannot be extracted via extract()" ;;
  esac
  else
    echo "'$1' is not a valid file"
      fi
}
