class STDERRSender
  def initialize(destination)
    # destination not configurable
  end

  def publish(message)
    STDERR.puts("STDERR: #{message}")
  end

  def to_s
    'stderr'
  end
end
