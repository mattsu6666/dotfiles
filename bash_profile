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
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

###
# unlimited history
##
HISTSIZE=
HISTFILESIZE=
