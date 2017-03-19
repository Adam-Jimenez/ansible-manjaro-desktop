# Ansible-manjaro-desktop

A playbook for setting up the tools I like on a fresh manjaro
installation.

## Setup

1. Ansible must be installed

>  sudo pacman -S ansible

2. SSH server must be running

```
sudo pacman -S openssh
sudo systemctl enable sshd
sudo systemctl start sshd
```

3. SSH pass is required to enter password

> sudo pacman -S sshpass

## Running

> ./run.sh
