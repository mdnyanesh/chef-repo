# Recipe to create clusters

WebSphereAS85_cluster "Cluster_01" do
	dmgr_profile "Dmgr01"
	profile_base "/opt/IBM/WebSphere/AppServer/profiles"
        wsadmin_user "wasuser"
	wsadmin_pass "wasuser"
	action :delete
end


