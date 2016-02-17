require 'spec_helper'
describe 'zabbix_client' do

  context 'with defaults for all parameters' do
    it { should contain_class('zabbix_client') }
  end
end
