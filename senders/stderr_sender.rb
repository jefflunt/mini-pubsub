require_relative './none_sender'

class STDERRSender < NoneSender
  def initialize(destination)
    super(destination)
  end

  def publish(message)
    STDERR.puts("STDERR: #{message}")
  end

  def to_s
    'stderr'
  end
end
