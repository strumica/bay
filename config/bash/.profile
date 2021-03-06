[ -f ~/.editor ] && . ~/.editor
[ "$BASH" ] && shopt -s completion_strip_exe
HISTCONTROL=erasedups
HISTIGNORE='q:ahist *'
HISTSIZE=20000
HISTTIMEFORMAT='%x %r '
PATH=/usr/local/bin:/usr/bin
PROMPT_COMMAND=gsh
TERM=cygwin-readline
export BROWSER=firefox
export CYGWIN=winsymlinks:native
export LC_ALL=en_US.UTF-8
export PAGER='env TERM=cygwin-less less'
export POSIXLY_CORRECT
alias acurl='curl -L'
alias afind='find -xtype l -delete -print'
alias agit='git --no-pager'
alias agrep='grep -I --color --exclude .bash_history --exclude-dir .git'
alias ahist='history | grep -i --color'
alias aless='TERM=cygwin-less less'
alias als='ls -ASgo'
alias aman='man -Kw'
alias apr='pr -dt'
alias area='readlink -e'
alias q='tput reset'
stty -ixon

gsh() {
  history -a
  if [ "$GSH" != "$PWD" ]
  then
    GSH=$PWD
  elif [ / -ot .git/HEAD ]
  then
    touch /
  else
    return
  fi
  if [ -f .git/index ] || [ -f .git ]
  then
    local gnr=$(git name-rev --name-only @)
    PS1='\n\033[33m\w \033[36m'"$gnr"'\033[m\n$ '
  else
    PS1='\n\033[33m\w\033[m\n$ '
  fi
}

ncurl() {
  curl -v "$@" 2>&1 | awk '
  $1 == ">" ||
  $1 == "HTTP/2" ||
  $1 == "HTTP/1.1" ||
  $2 == "Connected" ||
  tolower($1) == "location:" {
    $0 = "\33[1;33m" $0 "\33[m"
  }
  tolower($1) == "content-length:" {
    $0 = sprintf("\33[1;33m%s %\47d\33[m", $1, $2)
  }
  1
  '
}

nffprobe() {
  ffprobe -hide_banner "$@" 2>&1 |
  awk '$1 == "Stream" {$0 = "\33[1;33m" $0 "\33[m"} 1'
}

nod() {
  od -tcx1 -An -w19 | awk 'NR % 2 {$0 = "\33[1;32m" $0 "\33[m"} 1'
}

ntar() {
  tar --checkpoint-action 'ttyout=%T \r' "$@"
}

nwtime() {
  wtime "$@" 2>&1 | awk '/OperationCount/ {$0 = "\33[1;33m" $0 "\33[m"} 1'
}

xs() {
  z=$?
  if [ "$z" = 0 ]
  then
    printf '\33[1;32m%d SUCCESS\33[m\n' "$z"
  else
    printf '\33[1;31m%d FAILURE\33[m\n' "$z"
  fi
}
