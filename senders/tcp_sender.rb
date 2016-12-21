require 'socket'
require_relative './subscriber'

class TCPSender
  def initialize(host:, port:)
    @host = host
    @port = port
  end

  def send(msg)
    s = TCPSocket.new(@host, @port)
    s.puts(msg)
    s.close
  end
end
