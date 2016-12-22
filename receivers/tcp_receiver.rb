require_relative '../message'

class TCPReceiver
  def initialize(port)
    @port = port
    @server = TCPServer.new(port)
  end

  def gets
    client = @server.accept
    msg = Message.new(client.gets)
    client.close

    msg
  end
end
