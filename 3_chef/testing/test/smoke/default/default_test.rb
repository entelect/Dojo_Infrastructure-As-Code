# # encoding: utf-8
control 'webserver' do
  impact 1.0
  title 'Test Webserver'
  desc 'Check that the Webserver is configured correctly.'
  tag 'apache2'

  describe package('apache2') do
    it { should be_installed }
  end

  describe service('apache2') do
    it { should be_installed }
    it { should be_enabled }
    it { should be_running }
  end

  describe port(80) do
    it { should be_listening }
  end
end
