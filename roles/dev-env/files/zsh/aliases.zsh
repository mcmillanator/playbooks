# Oh my zsh
alias zshconfig="vim ~/.zshrc"
alias omz="vim ~/.oh-my-zsh"
alias omzconfig="vim ~/.oh-my-zsh"

alias myip="curl http://ipecho.net/plain; echo"
alias apps="cd ~/Documents/Projects"
alias la='ls -a'
alias ll='ls -lah'

# ruby
alias be='bundle exec $@'

alias win10='sudo /home/stan/Documents/Projects/virtual_machines/windows10vm.sh'

killdns() {
  sudo lsof -i :53 | awk '{ print $2 }' | grep -v PID | xargs sudo kill
}

restart_jack() {
  pulseaudio --kill

  jack_control start

  jack_control exit

  pulseaudio --start
}
