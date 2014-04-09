# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"



# Provide fix for Bug 12879 in VirtualBox: https://www.virtualbox.org/ticket/12879
$fix12879 = <<SCRIPT
if [ -e /opt/VBoxGuestAdditions-4.3.10/lib/VBoxGuestAdditions -a ! -h /usr/lib/VBoxGuestAdditions ]; then
    # If we're on version 4.3.10 of Guest Additions AND we haven't created the symlink:
    ln -s /opt/VBoxGuestAdditions-4.3.10/lib/VBoxGuestAdditions /usr/lib/VBoxGuestAdditions
    echo "Working around bug 12879 in VirtualBox. Next do a vagrant reload --provision'"
    exit 1
fi
SCRIPT

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "file://~/code/schof/packer-ubuntu-12.04-docker/packer_virtualbox-iso_virtualbox.box"
  config.vm.provision "shell", inline: $fix12879
  config.vm.provision "shell", path: "bootstrap.bash"
end


