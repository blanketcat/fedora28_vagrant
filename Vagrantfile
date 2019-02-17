# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  fedora = "bento/fedora-28"
  ubuntu = "ubuntu/xenial64"
  net_ip = "192.168.50"

  config.vm.define :master, primary: true do |master_config|
    master_config.vm.provider "virtualbox" do |vb|
        vb.memory = "4096"
        vb.cpus = 2
        vb.name = "master"
    end
      master_config.vm.box = "#{fedora}"
      master_config.vm.host_name = 'saltmaster.local'
      master_config.vm.network "private_network", ip: "#{net_ip}.10"
      master_config.vm.synced_folder "saltstack/salt/", "/srv/salt"
      master_config.vm.synced_folder "saltstack/pillar/", "/srv/pillar"
      master_config.vm.synced_folder "saltstack/formulas/", "/srv/formulas"

      master_config.vm.provision :salt do |salt|
        salt.master_config = "saltstack/etc/master"
        salt.master_key = "saltstack/keys/master_minion.pem"
        salt.master_pub = "saltstack/keys/master_minion.pub"
        salt.minion_key = "saltstack/keys/master_minion.pem"
        salt.minion_pub = "saltstack/keys/master_minion.pub"
        salt.seed_master = {
                            "web1" => "saltstack/keys/web1.pub",
                            "web2" => "saltstack/keys/web2.pub",
                            "ha-proxy1" => "saltstack/keys/ha-proxy1.pub",
                            "ha-proxy2" => "saltstack/keys/ha-proxy2.pub",
                            "ubuntu" => "saltstack/keys/ubuntu.pub"
                           }

        salt.install_type = "stable"
        salt.install_master = true
        salt.no_minion = true
        salt.verbose = true
        salt.colorize = true
        salt.bootstrap_options = "-P -c /tmp"
      master_config.vm.provision "shell", inline: <<-SHELL
        sudo dnf install nss-mdns avahi -y
        SHELL
      end
    end

    [
      ["ha-proxy1",    "#{net_ip}.11",    "1024",    fedora ],
      ["ha-proxy2",    "#{net_ip}.12",    "1024",    fedora ],
      ["web1",    "#{net_ip}.13",    "1024",    fedora ],
      ["web2",    "#{net_ip}.14",    "1024",    fedora ],
    ].each do |vmname,ip,mem,os|
      config.vm.define "#{vmname}" do |minion_config|
        minion_config.vm.provider "virtualbox" do |vb|
            vb.memory = "#{mem}"
            vb.cpus = 1
            vb.name = "#{vmname}"
        end
        minion_config.vm.box = "#{os}"
        minion_config.vm.hostname = "#{vmname}"
        minion_config.vm.network "private_network", ip: "#{ip}"

        minion_config.vm.provision :salt do |salt|
          salt.minion_config = "saltstack/etc/#{vmname}"
          salt.minion_key = "saltstack/keys/#{vmname}.pem"
          salt.minion_pub = "saltstack/keys/#{vmname}.pub"
          salt.install_type = "stable"
          salt.verbose = true
          salt.colorize = true
          salt.bootstrap_options = "-P -c /tmp"
        minion_config.vm.provision "shell", inline: <<-SHELL
          sudo dnf install nss-mdns avahi -y
          SHELL
        end
      end
    end

  config.vm.define :ubuntu, primary: true do |ubuntu_config|
    ubuntu_config.vm.provider "virtualbox" do |vb|
        vb.memory = "1024"
        vb.cpus = 1
        vb.name = "ubuntu"
    end
      ubuntu_config.vm.box = "#{ubuntu}"
      ubuntu_config.vm.host_name = 'ubuntu.local'
      ubuntu_config.vm.network "private_network", ip: "#{net_ip}.15"
  
      ubuntu_config.vm.provision :salt do |salt|
        salt.minion_config = "saltstack/etc/ubuntu"
        salt.minion_key = "saltstack/keys/ubuntu.pem"
        salt.minion_pub = "saltstack/keys/ubuntu.pub"
        salt.install_type = "stable"
        salt.verbose = true
        salt.colorize = true
#        salt.bootstrap_options = "-P -c /tmp"
      end
    end
  end
