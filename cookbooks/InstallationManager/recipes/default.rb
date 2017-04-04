#
# Cookbook Name:: InstallationManager
# Recipe:: default
#
# Copyright 2016, Rolb 
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

binary_dir = "#{Chef::Config[:file_cache_path]}/IMbinaries"
binary_path = "#{binary_dir}/agent.installer.linux.gtk.x86_64_#{node['InstallationManager']['im_version']}.zip"
binaries =  "#{node['InstallationManager']['package-name-1']}"
checksums = "#{node['InstallationManager']['package1-sha256sum']}"
base_dir = "/opt/IBM"
im_dir = "/opt/IBM/InstallationManager"
imagentdata_dir = "/opt/IBM/IMAgentData"
imshared_dir = "/opt/IBM/IMShared"
$cmd = ""
if platform_family?('rhel')
	$cmd = "#{binary_dir}/installc -acceptLicense -s -log /tmp/IM_install.log.xml -installationDirectory #{im_dir}"
elsif platform_family?('debian')
	$cmd = "#{binary_dir}/userinstc -log #{binary_dir}/instman.log -acceptLicense -dataLocation #{node['InstallationManager']['imagentdata_install_dir']}"
end

directory binary_dir do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

directory base_dir do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

directory im_dir do
 owner 'root'
 group 'root'
 mode '0755'
 action :create
end

directory imagentdata_dir do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

directory imshared_dir do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

package 'unzip' do
  action :install
end

package 'ftp' do
  action :install
end

#remote_file binary_path do
 # owner 'root'
#  group 'root'
#  mode '0644'
#  source "#{node['InstallationManager']['webserver']}/agent.installer.linux.gtk.x86_64_#{node['InstallationManager']['im_version']}.zip"
#  checksum "#{node['InstallationManager']['im-sha256sum']}"
#  notifies :create, "ruby_block[Validate IM Package Checksum]", :immediately
#end

Chef::Log.info("copying packages")

execute 'copy-im' do
  action :run
  command "scp #{node['InstallationManager']['ftploginuser']}@#{node['InstallationManager']['binaryhost']}:#{node['InstallationManager']['ftppath']}/#{binaries} #{binary_dir}"
  cwd binary_dir
  not_if do
       File.exist?("#{binary_path}")
    end
  end

ruby_block "Validate Package Checksum" do
   action :run
   block do
   require 'digest'
     checksum = Digest::SHA256.file("#{binary_dir}/#{binaries}").hexdigest
     if checksum != checksums
        raise "#{binaries} Downloaded package Checksum #{checksum} does not match known checksum #{checksums}"
     end
   end
end

execute 'extract-im' do
   action :run
   command "unzip -o #{binaries}"
   cwd binary_dir
   not_if do
     File.exist?("#{binary_dir}/installc")
  end
end

template "#{binary_dir}/#{node['InstallationManager']['im-responsefile']}" do
  source 'IM-responsefile.erb'
  variables(
  im: "#{node['InstallationManager']['im_install_dir']}",
  version: "#{node['InstallationManager']['im_version']}",
  id: "#{node['InstallationManager']['im_version']}"
  )
  owner 'root'
  group 'root'
  mode '0644'
  notifies :run, 'execute[install-InstallationManager]', :immediately
end

execute 'install-InstallationManager' do
  path = "#{im_dir}/eclipse"
  path = path.strip
  not_if do FileTest.directory?(path) end  
  command "#$cmd"
  cwd binary_dir
  action :run
end


ruby_block 'check InstallationManager' do
   block do
      imclinstalledversion = `#{node['InstallationManager']['imcl-path']} listInstalledPackages`.to_str.strip
      if imclinstalledversion.include? ("node['InstallationManager']['imcl-packageid']").to_str.strip
       raise "Installed version :#{imclinstalledversion}: does not match expected version :#{node['InstallationManager']['imcl-packageid']}:"
      end
    end
end 
