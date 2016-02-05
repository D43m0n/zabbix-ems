require 'spec_helper'
describe 'forgemodules' do

  context 'with defaults for all parameters' do
    it { should contain_class('forgemodules') }
  end
end
