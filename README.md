# About

This is my ansible playbook collection.  I use ansible for basic configuration of my personal computer(s) at home.
No consideration has been given to use by other people.

## Quick Start

```
ansible-pull --url <https://github.com/mcmillanator/playbooks.git> desktop-env.yaml

ansible-playbook -K desktop.yml --connection=local

# if there is an error about python3-apt then use the following to ensure ansible is using the correct python3
ansible-playbook -K desktop.yml --connection=local -e 'ansible_python_interpreter=/usr/bin/python3'
```


## TODO

### VMS

* Windows 10

### Packages

* docker-compose
* vscode
* home-brew
* ImageMagick

### Services & Servers

* postgresql
* redis

### Configs

* pulse audio sample rate
* <https://github.com/guard/listen/blob/master/README.md#increasing-the-amount-of-inotify-watchers>

### Ruby

#### Gems

* tmuxinator
* gemrc (no docs)

#### Guard

* BUNDLER_GEMFILE=~/.guard/Gemfile
* guard -G ~/.guard.rb
