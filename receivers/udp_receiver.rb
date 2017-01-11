require 'socket'
require_relative '../message'

class UDPReceiver
  MAXIMUM_PACKET_SIZE_BYTES = 512

  def initialize(port)
    @port = port
    @socket = UDPSocket.new
    @socket.bind('0.0.0.0', @port)
  end

  def receive
    raw_msg, address = @socket.recvfrom(MAXIMUM_PACKET_SIZE_BYTES)

    Message.new(raw_msg)
  end
end
