require 'spec_helper'

describe package('php') do
  it { should be_installed }
end

describe file('/etc/php.ini') do
  it { should be_file }
end