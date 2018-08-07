require 'socket'

module Senders
  class UNIX
    def initialize(destination)
      @socket_name = destination
    end

    def publish(msg)
      socket = UNIXSocket.new(@socket_name)
      socket.write msg
      socket.flush
      socket.close
    end

    def to_s
      "unix #{@socket_name}"
    end
  end
end
