module WebSphereAS85
  module Helper
	require 'chef/mixin/shell_out'
	require 'chef/mixin/language'
	include Chef::Mixin::ShellOut
        
	def wascmd(file=nil)
    		wsadmin_cmd = new_resource.profile_base + '/' + new_resource.dmgr_profile
		wsadmin_cmd += '/bin/wsadmin.sh -lang jython'

    		if new_resource.wsadmin_user && new_resource.wsadmin_pass
      			wsadmin_cmd += " -username '" + new_resource.wsadmin_user + "'"
      			wsadmin_cmd += " -password '" + new_resource.wsadmin_pass + "'"
    		end

    		if file
      			wsadmin_cmd += " -f #{file} "
    		else
      			wsadmin_cmd += " -c "
    		end

    		wsadmin_cmd
	end

	def wsadmin(args={})

    		if args[:user]
      			user = args[:user]
    		else
      			user = 'root'
    		end

    		if args[:file]
      			cmdfile = Tempfile.new('wascmd_')
      			cmdfile.chmod(0644)
      			cmdfile.write(args[:file])
      			cmdfile.rewind
      			modify = wascmd(cmdfile.path)
    		else
      			modify = wascmd + args[:command]
    		end

    		cmd = nil
		
    		begin
      		  Chef::Log.info "Executing as user #{user}: #{modify}"
     		  Dir.chdir("#{new_resource.profile_base}") do
			require 'mixlib/shellout'
    			cmd = Mixlib::ShellOut.new("#{modify}")
			cmd.run_command
		        Chef::Log.info "Cluster: #{cmd.stdout}"
		  end
        	  if args[:file]
        	  	cmdfile.close
                  	cmdfile.unlink
        	  end
    		end
			
	end
	
	def wsadminStatus(args={})
		if args[:user]
                        user = args[:user]
                else
                        user = 'root'
                end

                if args[:file]
                        cmdfile = Tempfile.new('wascmd_')
                        cmdfile.chmod(0644)
                        cmdfile.write(args[:file])
                        cmdfile.rewind
                        modify = wascmd(cmdfile.path)
                else
                        modify = wascmd + args[:command]
                end

                cmd = nil

                begin
                	cmd =`#{modify}`
 			  
                end
                  if args[:file]
                        cmdfile.close
                        cmdfile.unlink
                  end
		cmd
        end
  end
end
