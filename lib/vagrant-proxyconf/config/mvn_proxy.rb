require 'vagrant'
require_relative 'key_mixin'

module VagrantPlugins
  module ProxyConf
    module Config
      # Proxy configuration for Maven
      #
      # @!parse class MvnProxy < Vagrant::Plugin::V2::Config; end
      class MvnProxy < Vagrant.plugin('2', :config)
        include KeyMixin
        # @!parse extend KeyMixin::ClassMethods

        # @return [String] the HTTP proxy
        key :http, env_var: 'VAGRANT_MVN_HTTP_PROXY'
      end
    end
  end
end
