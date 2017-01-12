require 'socket'
require_relative './none_sender'

class TCPSender < NoneSender
  def initialize(destination)
    super(destination)

    @host, @port = destination.split(':')
    @port = @port.to_i
  end

  def publish(msg)
    socket = TCPSocket.new(@host, @port)
    socket.puts(msg)
    socket.close
  end

  def to_s
    "tcp #{@host}:#{@port}"
  end
end
