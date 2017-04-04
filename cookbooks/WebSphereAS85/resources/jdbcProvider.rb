# Resource for managing jdbcprovider 

actions :create_if_missing, :create, :delete

#<> @attribute jdbcprovider_name Name of the jdbcprovider.
attribute :jdbcprovider_name, :kind_of => String, :name_attribute => true

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

#<> @attribute scope. The scope in which JdbcProvider is to be managed.
attribute :scope, :kind_of => String

#<> @attribute cell. The cellname in which JdbcProvider is to be managed.
attribute :cell, :kind_of => String

#<> @attribute node. The nodename in which JdbcProvider is to be managed.
attribute :node, :kind_of => String

#<> @attribute cluster. The cluster in which JdbcProvider is to be managed.
attribute :cluster, :kind_of => String

##<> @attribute server. The servername in which JdbcProvider is to be managed.
attribute :server, :kind_of => String

#<> @property description: Manages the description of JdbcProvider
property :description, :kind_of => String

#<> @property implementationClassName: Manages the implementationClassName of JdbcProvider
property :implementationClassName, :kind_of => String

#<> @property classpath: Manages the classpath of JdbcProvider
property :classpath, :kind_of => String

#<> @property nativepath: Manages the nativepath of JdbcProvider
property :nativepath, :kind_of => String

default_action :create
