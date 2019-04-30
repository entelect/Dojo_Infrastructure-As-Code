# Configures the Vagrant Proxy and Installs any CA Certificates as required.
# If you have not installed the plugins, then the following will do nothing
def configure_proxy(config)  
  # If you need additional certificates you can install them here. This is
  # useful if you have a corporate proxy for example.
  # You can install plugins with
  #   vagrant plugin install vagrant-ca-certificates
  # This configuration will read the ENVIRONMENT variable CA_CERTS for the additional
  # certificate location
  if Vagrant.has_plugin?('vagrant-ca-certificates') && ENV['CA_CERTS']
    config.ca_certificates.enabled = true
    config.ca_certificates.certs = [ENV['CA_CERTS']]
  end

  # Also configure the Proxy if Required
  # You can install plugins with
  #   vagrant plugin install vagrant-proxyconf
  # Also the proxy settings will be loaded from the http_proxy and https_proxy
  # environment variables
  if Vagrant.has_plugin?("vagrant-proxyconf")
   config.proxy.http     = ENV['http_proxy']
   config.proxy.https    = ENV['https_proxy']
   config.proxy.no_proxy = "localhost,127.0.0.1,.example.com"
 end
end