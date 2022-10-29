#!/bin/bash

# Suppress `dpkg-preconfigure` warning related to stdin for `apt-get install`
#  https://serverfault.com/a/670688
export DEBIAN_FRONTEND=noninteractive


# Install Docker CLI completion
#  https://ismailyenigul.medium.com/enable-docker-command-line-auto-completion-in-bash-on-centos-ubuntu-5f1ac999a8a6
echo "Install Docker CLI completion"
#  1. Install bash completion
apt-get install -y bash-completion
#  2. Place the Docker completion script in /etc/bash_completion.d/
curl -sS -L https://raw.githubusercontent.com/docker/docker-ce/master/components/cli/contrib/completion/bash/docker -o /etc/bash_completion.d/docker.sh


# Install Docker Compose CLI completion
#  https://docker-docs.netlify.app/compose/completion/
#  TODO: It doesn't work. It autocompletes `compose` indefinitely: `docker-compose compose compose compose compose ...`
#  TODO: If `docker compose v2` is used, then we don't need this completion
echo "Install Docker Compose CLI completion"
#  1. Bash completion was already installed in the previous section
#  2. Place the Docker Compose completion script in /etc/bash_completion.d/
#     IMPORTANT: Docker Compose version in the URL should match the Docker Compose version installed in the VM
#                In our case is 1.24.1, which is the default version installed by Vagrant Docker Compose plugin
curl -sS -L https://raw.githubusercontent.com/docker/compose/1.24.1/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose


# Install Docker Color Output
#  https://github.com/devemio/docker-color-output
echo "Install Docker Color Output"
add-apt-repository -y ppa:dldash/core
apt-get update
apt-get install -y docker-color-output
#  Add `dco` alias
#  As recommended by Ubuntu, our custom aliases will be added to ~/.bash_aliases
echo '# Docker Color Output (https://github.com/devemio/docker-color-output)' >> /home/vagrant/.bash_aliases
echo 'alias dco="docker-color-output"' >> /home/vagrant/.bash_aliases
