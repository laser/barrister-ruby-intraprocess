require 'barrister/intraprocess/version'

module Barrister

  module Containers

    class IntraProcess

      def initialize(json_path, service_klass, interface_name=nil)
        contract = Barrister::contract_from_file(json_path)
        @server  = Barrister::Server.new(contract)
        @server.add_handler(interface_name || service_klass.to_s, service_klass.new)
      end

      def process(message)
        @server.handle(message)
      end

    end

  end

  module Transports

    class IntraProcess

      def initialize(service_container)
        @service_container = service_container
      end

      def request(message)
        @service_container.process message
      end

    end

  end

end
