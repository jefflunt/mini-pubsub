require 'socket'
require_relative '../message'

module Receivers
  class TCP
    def initialize(port)
      @port = port
      @server = TCPServer.new(port)
    end

    def receive
      client = @server.accept
      raw_msg = client.gets
      client.close

      Message.new(raw_msg)
    end

    def cleanup
    end
  end
end
