require 'socket'
require_relative '../message'

class UDPSender
  def initialize(destination)
    @host, @port = destination.split(':')
    @port = @port.to_i
  end

  def publish(msg)
    socket = UDPSocket.new
    socket.send(msg, 0, @host, @port)
    socket.close
  end

  def to_s
    "udp #{@host}:#{@port}"
  end
end
