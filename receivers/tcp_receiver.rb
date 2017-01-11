require 'socket'
require_relative '../message'

class TCPReceiver
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
end
