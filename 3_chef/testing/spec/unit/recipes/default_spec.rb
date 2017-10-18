#
# Cookbook:: testing
# Spec:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'testing::default' do
  context 'When all attributes are default, on an Ubuntu 16.04' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'should install package' do
      expect(chef_run).to install_package 'apache2'
    end

    it 'should enabled service' do
      expect(chef_run).to enable_service 'apache2'
    end

    it 'should start service' do
      expect(chef_run).to start_service 'apache2'
    end

    it 'should create template' do
      expect(chef_run).to create_template '/var/www/index.html'
    end
  end
end
