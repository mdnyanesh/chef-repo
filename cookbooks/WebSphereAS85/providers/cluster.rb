# Provider for resource Cluster

require 'chef/mixin/shell_out'
require 'chef/mixin/language'
include Chef::Mixin::ShellOut
include WebSphereAS85::Helper 

action :create do
   
    path = new_resource.profile_base + '/' + new_resource.dmgr_profile + "/config/cells/#{node["hostname"]}Cell/clusters/" + new_resource.cluster_name
    path = path.strip
    if ::File.exists?(path)
           puts "\nCluster : #{new_resource.cluster_name} already exists"
    else
          update(new_resource)
    end

end

action :create_if_missing do
       
    path = new_resource.profile_base + '/' + new_resource.dmgr_profile + "/config/cells/#{node["hostname"]}Cell/clusters/" + new_resource.cluster_name
    path = path.strip    
    if ::File.exists?(path)
     	   puts "\nCluster : #{new_resource.cluster_name} already exists"
    else
    	  update(new_resource) 
    end 
end

action :delete do
   
    cmd = "\"AdminConfig.getid('/ServerCluster:"
    cmd += new_resource.cluster_name
    cmd += "/')\""
    result = wsadminStatus(:command => cmd, :user => new_resource.user) 
    
    if result.include? "#{new_resource.cluster_name}"    
	destroy(new_resource)
    else
        puts "\nCluster : #{new_resource.cluster_name} does not exist"
    end  
end

def update(new_resource)
   
    cmd = "\"AdminTask.createCluster('[-clusterConfig [-clusterName "
    cmd += new_resource.cluster_name
    cmd += "]]')\""

    puts "\nCreating cluster : #{new_resource.cluster_name} via #{cmd}"

    wsadmin(:command => cmd, :user => new_resource.user)
     puts "\nCluster : #{new_resource.cluster_name} created"
    new_resource.updated_by_last_action(true)
end

def destroy(new_resource)

    cmd = "\"AdminTask.deleteCluster('[-clusterName "
    cmd += new_resource.cluster_name
    cmd += "]')\""

    puts "\nDeleting cluster : #{new_resource.cluster_name} via #{cmd}"
    wsadmin(:command => cmd, :user => new_resource.user)
    puts "\nCluster : #{new_resource.cluster_name} deleted"
    new_resource.updated_by_last_action(true)
end	
