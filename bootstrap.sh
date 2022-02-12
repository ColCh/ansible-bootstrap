#!/usr/bin/env bash

set -euo pipefail

SETUP_DIR="setup"

if [[ -d $SETUP_DIR ]]; then
    rm -r $SETUP_DIR;
fi;

export GH_W_AUTH=https://$GH_USER:$GH_TOKEN@github.com
export GH_ANSIBLE_REPO=$GH_W_AUTH/$GH_USER/$GH_ANSIBLE_REPO_NAME.git
export B_USER=$USER
export B_GH_USER=$GH_USER
export B_DOTFILES=https://$GH_USER:$GH_TOKEN@github.com/$GH_USER/$GH_DOTFILES_REPO.git

export \
    B_USER \
    B_GH_USER \
    B_SSH_NEW_PORT \
    B_DOTFILES

sudo apt install -y software-properties-common  && \
    sudo apt-add-repository -y ppa:ansible/ansible && \
    sudo apt update && \
    sudo apt install -y ansible=5.* git && \
    git clone "$GH_ANSIBLE_REPO" "$SETUP_DIR" && \
    cd "$SETUP_DIR" || exit 1 && \
    sudo ansible-playbook dev.yml -i ./hosts -vvv \
    --extra-vars "my_user=$B_USER github_user=$B_GH_USER new_sshd_port=$B_SSH_NEW_PORT dotfiles_repo='$B_DOTFILES'" && \
    rm -rf "$SETUP_DIR" && \
    sudo apt remove -y ansible && \
    sudo apt-add-repository --remove -y ppa:ansible/ansible
