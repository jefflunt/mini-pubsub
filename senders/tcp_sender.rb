require 'socket'

class TCPSender
  def initialize(destination)
    @host, @port = destination.split(':')
    @port = @port.to_i
  end

  def puts(msg)
    s = TCPSocket.new(@host, @port)
    s.puts(msg)
    s.close
  end

  def to_s
    "tcp #{@host}:#{@port}"
  end
end
