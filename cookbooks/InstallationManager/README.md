InstallationManager Cookbook
============================


This cookbook installs IBM Installation Manager version 1.8.3 at /opt/IBM/InstallationManager path.

This cookbook can be used with my FTPlogin cookbook to scp binaries required to copy. I am not including the binaries in this cookbook.

The code also verifies the checksum of the files after copying to the node. The install will fail if the checksum fails.

Requirements
------------
Platforms: Ubuntu 15.04

Attributes
----------
default['InstallationManager']['version'] = '1.8.3'

default['InstallationManager']['name'] = 'InstallationManager'

default['InstallationManager']['message'] = 'Installing InstallationManager version 1.8 to /opt/IBM/InstallationManager'

default['InstallationManager']['package-name-1'] = 'agent.installer.linux.gtk.x86_64_1.8.3000.20150606_0047.zip'

default['InstallationManager']['binaryhost'] = 'Server where the binaries are stored'

default['InstallationManager']['im_version'] = '1.8.3000.20150606_0047'

default['InstallationManager']['im_install_dir'] = '/opt/IBM/InstallationManager'

default['InstallationManager']['imshared_install_dir'] = 'opt/IBM/IMShared'

default['InstallationManager']['imagentdata_install_dir'] = '/opt/IBM/IMAgentData'

default['InstallationManager']['im-responsefile'] = 'install.xml'

default['InstallationManager']['im-id'] = 'IBM Installation Manager'

default['InstallationManager']['package1-sha256sum'] = 'b517395f37e7bfbeeb8481b83f4f280580a30bb972616aeb02056fa64d50a05e'

default['InstallationManager']['imcl-path'] = '/opt/IBM/InstallationManager/eclipse/tools/imcl'

default['InstallationManager']['imcl-packageid'] = 'com.ibm.cic.agent_1.8.3000.20150606_0047'

default['InstallationManager']['ftploginuser'] = 'User to login to the binary host with'

default['InstallationManager']['ftppath'] = 'Path where the binaries are stored'

Usage
-----
Add to the node's run list

knife node run_list add <node name> 'recipe[InstallationManager::default]'

License and Authors
-------------------
Rohit Gabriel, Auckland, New Zealand.

Profile: https://nz.linkedin.com/in/rohit-gabriel-22a76320
