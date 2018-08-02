require 'socket'
require_relative '../message'

module Receivers
  class UNIX
    def initialize(socket_name)
      @socket_name = socket_name
      @server = UNIXServer.new(@socket_name)
    end

    def receive
      socket = @server.accept
      msg = Message.new(socket.readline)
      socket.close

      msg
    end

    def cleanup
      `rm #{@socket_name}`
    end
  end
end
