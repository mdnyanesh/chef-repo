# Resource for managing cluster member

actions :create_if_missing, :create, :delete

#<> @attribute profile_base Path of the profilebase.
attribute :profile_base, :kind_of => String

#<> @attribute dmgr_profile Name of the Dmgr profile.
attribute :dmgr_profile, :kind_of => String

#<> @attribute cluster_name Name of the cluster.
attribute :cluster_name, :kind_of => String, :name_attribute => true

#<> @attribute dmgr_host : The DMGR host to add this cluster member to.
attribute :dmgr_host, :kind_of => String

#<> @attribute node : The node name to add this cluster member to.
attribute :node, :kind_of => String

#<> @attribute cluster__member_name Name of the cluster member.
attribute :cluster_member_name, :kind_of => String, :name_attribute => true

#<> @attribute cell : Name of the cell in which cluster member is to be created.
attribute :cell, :kind_of => String

#<> @property client_inactivity_timeout : Manages the clientInactivityTimeout for the TransactionService.
property:client_inactivity_timeout, :kind_of => Integer

#<> @attribute gen_unique_ports : Specifies whether the genUniquePorts when adding a cluster member.
attribute :gen_unique_ports, :kind_of => [TrueClass, FalseClass], :default => true

#<> @property jvm_maximum_heap_size: Manages the maximumHeapSize setting for the cluster member's JVM.
property :jvm_maximum_heap_size, :kind_of => Integer, :default => 1024

#<> @property jvm_verbose_mode_class : Manages the verboseModeClass setting for the cluster member's JVM.
property :jvm_verbose_mode_class, :kind_of => [TrueClass, FalseClass], :default => false

#<> @property jvm_verbose_garbage_collection : Manages the verboseModeGarbageCollection setting for the cluster member's JVM
property :jvm_verbose_garbage_collection, :kind_of => [TrueClass, FalseClass], :default => false

#<> @property jvm_verbose_mode_jni : Manages the verboseModeJNI setting for the cluster member's JVM 
property :jvm_verbose_mode_jni, :kind_of => [TrueClass, FalseClass], :default => false

#<> @property jvm_initial_heap_size: Manages the initial heap Size setting for the cluster member's JVM.
property :jvm_initial_heap_size, :kind_of => Integer, :default => 1024

#<> @property jvm_run_hprof : Manages the runHProf setting for the cluster member's JVM
property :jvm_run_hprof, :kind_of => [TrueClass, FalseClass], :default => false

#<> @property jvm_hprof_arguments : Manages the hprofArguments setting for the cluster member's JVM
property :jvm_hprof_arguments, :kind_of => String

#<> @property jvm_debug_mode : Manages the debugMode setting for the cluster member's JVM
property :jvm_debug_mode, :kind_of => String

#<> @property jvm_debug_args : Manages the debugArgs setting for the cluster member's JVM
property :jvm_debug_args, :kind_of => String

# #<> @property jvm_executable_jar_filename : Manages the executableJarFileName setting for the cluster member's JVM
property :jvm_executable_jar_filename, :kind_of => String

# #<> @property jvm_generic_jvm_arguments : Manages the genericJvmArguments setting for the cluster member's JVM
property :jvm_generic_jvm_arguments, :kind_of => String

# #<> @property jvm_disable_jit : Manages the disableJIT setting for the cluster member's JVM
property :jvm_disable_jit, :kind_of => String

# #<> @property runas_group : Manages the runAsGroup for a cluster member
property :runas_group, :kind_of => String

# #<> @property runas_user : Manages the runAsUser for a cluster member
property :runas_user, :kind_of => String

# #<> @property total_transaction_timeout : Manages the totalTranLifetimeTimeout for the ApplicationServer
property :total_transaction_timeout, :kind_of => Integer

#<> @property threadpool_webcontainer_min_size : Manages the minimumSize setting for the WebContainer ThreadPool
property :threadpool_webcontainer_min_size, :kind_of => Integer

#<> @property threadpool_webcontainer_max_size : Manages the maximumSize setting for the WebContainer ThreadPool
property :threadpool_webcontainer_max_size, :kind_of => Integer

#<> @property umask : Manages the ProcessExecution umask for a cluster member
property :umask, :kind_of => Integer, :default => 022

#<> @attribute user Optional. The user to run the `wsadmin` command as. Defaults to "root".
attribute :user, :kind_of => String, :default => 'root'

#<> @attribute wsadmin_user Optional. The username for `wsadmin` authentication if security is enabled.
attribute :wsadmin_user, :kind_of => String

#<> @attribute wsadmin_pass Optional. The password for `wsadmin` authentication if security is enabled.
attribute :wsadmin_pass, :kind_of => String

#<> @attribute weight Optional. Manages the cluster member weight (memberWeight) when adding a cluster member.
attribute :weight, :kind_of => Integer, :default => 2

default_action :create_if_missing

