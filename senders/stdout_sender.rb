require_relative './none_sender'

class STDOUTSender < NoneSender
  def initialize(destination)
    super(destination)
  end

  def publish(message)
    STDOUT.puts(message)
  end

  def to_s
    'stdout'
  end
end
