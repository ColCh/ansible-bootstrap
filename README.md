# Ansible playbook

## Install ansible

### Ubuntu

SSH into machine with **Auth forwarding** and do this:

```sh
# SET IT
export GH_TOKEN="TODO" B_SSH_NEW_PORT=1337;

export GH_USER="ColCh" GH_ANSIBLE_REPO_NAME=ansible-bootstrap GH_ANSIBLE_PATH=main/bootstrap.sh GH_DOTFILES_REPO=dotfiles CURL_AUTH_H="Authorization: token $GH_TOKEN" CURL_ACCEPT_H="Accept: application/vnd.github.v3.raw" GH_RAW_HOST="https://raw.githubusercontent.com";

curl -fsSL -H "$CURL_AUTH_H" -H "$CURL_ACCEPT_H" -L $GH_RAW_HOST/$GH_USER/$GH_ANSIBLE_REPO_NAME/$GH_ANSIBLE_PATH | bash
```

## Launch ansible

To run specific ansible task:

```sh
sudo ansible-playbook ... --step --start-at-task='DESIRED_TASK'
```
