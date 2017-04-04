cd /root/chef-repo
knife upload ./data_bags/was-config
knife data bag from yaml was-config JdbcProv.yaml

