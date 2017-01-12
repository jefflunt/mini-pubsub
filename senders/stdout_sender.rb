class STDOUTSender
  def initialize(destination)
    # destination not configurable
  end

  def publish(message)
    STDOUT.puts(message)
  end

  def to_s
    'stdout'
  end
end
