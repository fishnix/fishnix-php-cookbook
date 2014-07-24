#
# Cookbook Name:: fishnix-php
# Recipe:: default
#
# Copyright 2011, E Camden Fisher
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

chef_gem "chef-rewind"
require 'chef/rewind'

include_recipe 'php::ini'

unwind "template[#{node['php']['conf_dir']}/php.ini]"

# fishnix-php.ini.erb located inside fishnix-php/templates/default/fishnix-php.ini.erb
template "#{node['php']['conf_dir']}/php.ini" do
  source "fishnix-php.ini.erb"
  cookbook_name "fishnix-php"
	unless platform?('windows')
		owner 'root'
		group 'root'
		mode '0644'
	end
  variables ({
      :max_execution_time => node['fishnix-php']['max_execution_time'],
      :max_input_time => node['fishnix-php']['max_input_time'],
      :memory_limit => node['fishnix-php']['memory_limit'],
      :post_max_size => node['fishnix-php']['post_max_size'],
      :upload_max_filesize => node['fishnix-php']['upload_max_filesize'],
      :session_handler => node['fishnix-php']['session_handler'],
      :memcache_session_save_path => node['fishnix-php']['memcache_session_save_path'],
      :session_save_path => node['fishnix-php']['session_save_path']
    })
end
