require 'socket'
require_relative '../message'

class UDPSender
  def initialize(destination)
    @host, @port = destination.split(':')
    @port = @port.to_i
  end

  ## THIS DOESN'T WORK YET
  def puts(msg)
    socket = UDPSocket.new
    socket.send(msg, 0, @host, @port)
    socket.close
  end
end
