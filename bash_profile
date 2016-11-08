PS1='\u:\W$ '

###
# lsコマンドの設定
##
alias ls='ls -G'
alias ll='ls -lh'
alias la='ls -A'
export LSCOLORS=gxfxcxdxbxegedabagacad

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi
