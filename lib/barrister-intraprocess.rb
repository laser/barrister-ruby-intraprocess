require 'barrister-intraprocess/version'

module Barrister

  class IntraProcessContainer

    def initialize(json_path, handlers)
      contract = Barrister::contract_from_file(json_path)
      @server  = Barrister::Server.new(contract)

      # in case we are passed a single handler
      handlers = handlers.kind_of?(Array) ? handlers : [handlers]

      # register each provided handler
      handlers.each do |handler|
        iface_name = handler.class.to_s.split('::').last
        @server.add_handler iface_name, handler
      end
    end

    def process(message)
      @server.handle(message)
    end

  end

  class IntraProcessTransport

    def initialize(service_container)
      @service_container = service_container
    end

    def request(message)
      @service_container.process message
    end

  end

end
