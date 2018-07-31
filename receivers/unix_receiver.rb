require 'socket'
require_relative '../message'

class UNIXReceiver
  MAX_MESSAGE_SIZE = 65536

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
