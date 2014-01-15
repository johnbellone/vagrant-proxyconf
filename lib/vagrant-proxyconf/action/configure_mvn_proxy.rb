require_relative 'base'

module VagrantPlugins
  module ProxyConf
    class Action
      # Action for configuring Maven proxy environment on guest.
      class ConfigureMvnProxy < Base
        def config_name
          'mvn_proxy'
        end

        private

        def configure_machine
          write_config(maven_config)
        end

        def maven_config
          uri = URI.parse(config.http)
          <<-CONFIG
<proxies>
        <proxy>
                <active>true</active>
                <protocol>#{uri.scheme}</protocol>
                <host>#{uri.host}</host>
                <port>#{uri.port}</port>
                <user>#{uri.user}</user>
                <password>#{uri.password}</password>
        </proxy>
</proxies>
          CONFIG
        end
      end
    end
  end
end
