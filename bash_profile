PS1='\u:\W$ '

###
# lsコマンドの設定
##
alias ls='ls -G'
alias ll='ls -lh'
alias la='ls -A'
export LSCOLORS=gxfxcxdxbxegedabagacad

###
# for mac
##
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

export JAVA_HOME=`/System/Library/Frameworks/JavaVM.framework/Versions/A/Commands/java_home -v "10"`
PATH=${JAVA_HOME}/bin:${PATH}
PATH=${HOME}/.embulk/bin:${PATH}
PATH=$HOME/.nodebrew/current/bin:${PATH}

export SBT_OPTS="-Dfile.encoding=UTF8 -Xmx1536M -XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled -Xss2M  -Duser.timezone=JST"

###
# unlimited history
##
HISTSIZE=
HISTFILESIZE=

###
# gitのタブ補完
##
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
BREW_SCRIPTS="$(brew --prefix)/etc/bash_completion.d"
[ -f "$BREW_SCRIPTS/git-prompt.sh" ] && . "$BREW_SCRIPTS/git-prompt.sh" && PS1='[\u:\W$(__git_ps1 "(%s)")]\$ '

###
# golang
export GOROOT=/usr/local/go
export GOPATH=$HOME/go

###
# Rust
##
export PATH="$HOME/.cargo/bin:$PATH"
