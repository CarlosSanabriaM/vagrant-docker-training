
# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

### Configuration parameters ###
# Virtual machine name
VM_NAME = "vagrant-docker-training"
# Virtual machine memory (MB)
VM_MEMORY_MB = "2048"
################################

Vagrant.configure("2") do |config|

  # Every Vagrant development environment requires a box.
  config.vm.box = "ubuntu/jammy64"
  #config.vm.box = "hashicorp/bionic64" # Use this box if the other one fails
  # This is the name vagrant outputs on the console and logs.
  config.vm.define VM_NAME
  # This is the hostname inside the VM.
  config.vm.hostname = VM_NAME

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine.
  #config.vm.network "forwarded_port", guest: XXXX, host: XXXX
  config.vm.network "forwarded_port", guest: 8888, host: 8888

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  config.vm.provider "virtualbox" do |vb|
    # This is the name VirtualBox uses for the VM.
    vb.name = VM_NAME
    # Set RAM for the VM.
    vb.memory = VM_MEMORY_MB
  end

  # Enable provisioning with Docker and Docker Compose.
  config.vm.provision :docker
  # Execute `docker compose up` on every `vagrant up` (runs all containers defined in `docker-compose.yml`).
  config.vm.provision "shell", name: "Docker Compose up",         inline: "docker compose -f /vagrant/docker-compose.yml up -d --quiet-pull", run: "always"
  # Execute configuration shell scripts.
  config.vm.provision "shell", name: "Create ~/.bash_aliases file", path: "scripts/vagrant/create-bash-aliases-file.sh"
  config.vm.provision "shell", name: "Configure ~/.profile file",   path: "scripts/vagrant/configure-profile-file.sh"
  config.vm.provision "shell", name: "Install dive",                path: "scripts/vagrant/install-dive.sh"
  config.vm.provision "shell", name: "Install Docker extensions",   path: "scripts/vagrant/install-docker-extensions.sh"
  config.vm.provision "shell", name: "Install jq",                  path: "scripts/vagrant/install-jq.sh"
  config.vm.provision "shell", name: "Configure tmux",              path: "scripts/vagrant/tmux.sh"
  config.vm.provision "shell", name: "Configure motd",              path: "scripts/vagrant/motd.sh", run: "always"

end
