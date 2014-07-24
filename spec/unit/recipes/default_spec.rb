require 'spec_helper'

describe 'fishnix-php::default' do

  platforms = {
    'centos' => ['6.5'],
  }
  
  platforms.each do |platform, versions|
    versions.each do |version|

      context "on #{platform.capitalize} #{version}" do
        let (:chef_run) do
          ChefSpec::Runner.new(log_level: :warn, platform: platform, version: version) do |node|
          end.converge(described_recipe) 
        end
    
        it 'should include the php recipe by default' do
          chef_run.should include_recipe 'php::default'
        end
      end
    end
  end
end