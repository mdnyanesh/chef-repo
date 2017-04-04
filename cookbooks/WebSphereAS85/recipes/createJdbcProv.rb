# Recipe for craetion of JDBC provider
$cmd = ""
$jdbcProvName = ""
$scope = ""
$cellName = ""
$nodeOrClusterName = ""
$serverName = ""
$desc = ""
$implmenType = ""
$classPath = ""
$nativepath = ""
$dbtype = ""
$jdbcProviderType = ""

was_config_data = data_bag('was-config')
was_config_data.each do |identifier|
	jdbc_data = data_bag_item('was-config', identifier)
	$jdbcProvName = jdbc_data['jdbcName']
	$scope = jdbc_data['scope']
	$cellName = jdbc_data['cellName']
	$nodeOrClusterName = jdbc_data['nodeOrClusterName']
	$serverName = jdbc_data['serverName']
	$desc = jdbc_data['desc']
	$implmenType = jdbc_data['implmenType']
	$classPath = jdbc_data['classPath']
	$nativepath = jdbc_data['nativepath']
	$dbtype = jdbc_data['dbtype']
	$jdbcProviderType = jdbc_data['jdbcProviderType']
end	
        if "#$scope" == "cell"
        $cmd = "/opt/IBM/WebSphere/AppServer/profiles/Dmgr01/bin/wsadmin.sh -lang jython -f /home/vagrant/config-data/WAS/manageJ.py \'#$jdbcProvName\' #$scope \'#$cellName\' description \'#$desc\' implementationClassName #$implmenType classpath \'#$classPath\' nativepath \'#$nativepath\'"# databaseType \'#$dbtype\' providerType \'#$jdbcProviderType\'" 
	elsif "#$scope" == "node" or "#$scope" == "cluster"
	$cmd = "/opt/IBM/WebSphere/AppServer/profiles/Dmgr01/bin/wsadmin.sh -lang jython -f /home/vagrant/config-data/WAS/manageJ.py \'#$jdbcProvName\' #$scope \'#$cellName\' \'#$nodeOrClusterName\' description \'#$desc\' implementationClassName #$implmenType classpath \'#$classPath\' nativepath \'#$nativepath\'"# databaseType \'#$dbtype\' providerType \'#$jdbcProviderType\'" 
	elsif "#$scope" == "server"
	$cmd = "/opt/IBM/WebSphere/AppServer/profiles/Dmgr01/bin/wsadmin.sh -lang jython -f /home/vagrant/config-data/WAS/manageJ.py \'#$jdbcProvName\' #$scope \'#$cellName\' \'#$nodeOrClusterName\' \'#$serverName\' description \'#$desc\' implementationClassName #$implmenType classpath \'#$classPath\' nativepath \'#$nativepath\'"# databaseType \'#$dbtype\' providerType \'#$jdbcProviderType\'"
	end

execute "#$jdbcProvName" do
	command "#$cmd"
	action :run
end
