require 'socket'

module Senders
  class UNIX
    def initialize(destination)
      super(destination)

      @socket_name = destination
    end

    def publish(message)
      retries = 0
      begin
        socket = UNIXSocket.new(@socket_name)
        socket.write msg
        socket.close
      rescue
        retry unless (retries += 1) > 10
      end
    end

    def to_s
      "unix #{@socket_name}"
    end
  end
end
