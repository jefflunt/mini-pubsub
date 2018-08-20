require 'socket'
require_relative '../message'

module Receivers
  class UNIX
    ACCEPT_BACKLOG = 1000

    def initialize(socket_name)
      @socket_name = socket_name
      @server = UNIXServer.new(@socket_name)
      @server.listen(ACCEPT_BACKLOG)
    end

    # NOTE: this is simple - setup and teardown a new socket every time, it
    # supports any number of clients automatically. however, there's overhead
    # associated with socket setup and teardown, so it might be good to
    # investigate just how costly this is in terms of time
    def receive
      socket = @server.accept
      msg = socket.readline.strip
      socket.close

      Message.new(msg.strip)
    end

    def cleanup
      @server.close
      `rm #{@socket_name}`
    end
  end
end
