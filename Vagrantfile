
# frozen_string_literal: true
def vm(opt)
  module_name = opt.fetch(:module).to_s || raise(ArgumentError, 'Must provide puppet module name')
  hostname = opt.fetch(:hostname, module_name).to_s
  memory = opt.fetch(:memory, 512)
  cpu = opt.fetch(:cpu, 1)
  box = opt.fetch(:box).to_s || raise(ArgumentError, 'Must provide box type.')
  url = opt.fetch(:url, '').to_s
  os_type = opt[:os_type] || opt[:type] || :linux
  gui = opt.fetch(:gui, false)
  ports = Array(opt.fetch(:port, []))
  iso = opt.fetch(:iso, nil)
  proj_root = File.expand_path(File.join(File.dirname(__FILE__)))
  fixture_modules = File.join(proj_root, 'spec', 'fixtures', 'modules')
  sql_server_path = opt[:sqlserver_path]
  Vagrant.configure('2') do |conf|
    # forward all the ports
    ports.each do |p|
      conf.vm.network(:forwarded_port, guest: p, host: p, auto_correct: true)
    end

    if os_type == :windows
      conf.ssh.username = 'vagrant'
      conf.winrm.username = 'vagrant'
      conf.winrm.password = 'vagrant'
    end

    conf.vm.define hostname.to_sym do |mod|
      mod.vm.box = box
      mod.vm.box_url = url
      # mod.vm.synced_folder './', "/etc/puppet/modules/#{module_name}"
      # mod.vm.synced_folder 'spec/fixtures/modules', '/tmp/puppet/modules'

      mod.vm.hostname = hostname

      mod.vm.provider :vmware_fusion do |f|
        f.gui = gui
        f.vmx['displayName'] = hostname
        f.vmx['memsize'] = memory
        f.vmx['numvcpus'] = cpu
        if iso
          f.vmx['ide1:0.devicetype'] = 'cdrom-image'
          f.vmx['ide1:0.filename'] = iso
        end
      end

      mod.vm.provider :vmware_workstation do |f|
        f.gui = gui
        f.vmx['displayName'] = hostname
        f.vmx['memsize'] = memory
        f.vmx['numvcpus'] = cpu
        if iso
          f.vmx['ide1:0.devicetype'] = 'cdrom-image'
          f.vmx['ide1:0.filename'] = iso
        end
      end

      mod.vm.provider :virtualbox do |v|
        v.gui = gui
        v.name = hostname
        v.memory = memory
        v.cpus = cpu
      end
    end
  end
end

module_name = File.basename(File.expand_path(File.join(File.dirname(__FILE__))))
vm hostname: 'ci_runner', module: module_name, box: 'puppetlabs/centos-7.2-64-puppet',
   url: 'puppetlabs/centos-7.2-64-puppet', cpu: 1, memory: 8124, gui: false
vm hostname: 'centos6', module: module_name, box: 'puppetlabs/centos-7.2-64-puppet',
   url: 'puppetlabs/centos-7.2-64-puppet', cpu: 1, memory: 8124, gui: false
