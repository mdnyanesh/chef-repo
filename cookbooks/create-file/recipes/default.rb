#
# Cookbook Name:: create-file
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#------------------------------------------------
#	------Simple File creation-------
#------------------------------------------------
file '/tmp/example-chef' do
	content 'Here is my first file modified'
	mode '0755'
	action :create
end


#-------------------------------------------------
#	------- Data bag file creation   -------
#--------------------------------------------------

first_bag_data = data_bag('first-bag')
first_bag_data.each do |identifier|
	file_data = data_bag_item('first-bag', identifier)
	file file_data['name'] do
		path file_data['path']
		content	file_data['content']
		mode '0755'
        	action :create
	end
end

#first_bag_data.each do |identifier|
#	file_data = data_bag_item('first-bag', identifier)
#	file(identifier) do
#		path file-data['path']
#		content	file_data['content']
#		mode '0755'
 #       	action :create
#	end
#end

#-------------------------------------------------------
# 	--------File creation from yaml---------
#------------------------------------------------------

#require 'yaml'
#file-data = YAML.load_file('/home/vagrant/config-data/file-data.yaml')
#	file file-data['name'] do
 #               path file-data['path']
  #              content file-data['content']
   #             mode file-data['mode']
    #            action :create
     #   end


