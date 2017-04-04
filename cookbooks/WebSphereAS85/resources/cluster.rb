# Resource for managing cluster 

actions :create_if_missing, :create, :delete

#<> @attribute cluster_name Name of the cluster.
attribute :cluster_name, :kind_of => String, :name_attribute => true

#<> @attribute dmgr_profile Name of the Dmgr profile.
attribute :dmgr_profile, :kind_of => String

#<> @attribute profile_base Path of the profilebase.
attribute :profile_base, :kind_of => String 

#<> @attribute user Optional. The user to run the `wsadmin` command as. Defaults to "root".
attribute :user, :kind_of => String, :default => 'root'

#<> @attribute wsadmin_user Optional. The username for `wsadmin` authentication if security is enabled.
attribute :wsadmin_user, :kind_of => String

#<> @attribute wsadmin_pass Optional. The password for `wsadmin` authentication if security is enabled.
attribute :wsadmin_pass, :kind_of => String

default_action :create
