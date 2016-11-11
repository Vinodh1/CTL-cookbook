#
# Cookbook Name:: chef_example
# Spec:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'chef_example::default' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end
	
    it 'should set the selinux permissive' do
      expect(chef_run.node['selinux']['state']).to eq('permissive')
    end
	
    it 'should include the selinux::default recipe' do
      expect(chef_run).to include_recipe('selinux::default')
    end

    it 'should include the java::default recipe' do
      expect(chef_run).to include_recipe('java::default')
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
