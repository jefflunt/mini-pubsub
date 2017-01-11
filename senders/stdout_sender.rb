class STDOUTSender
  def publish(message)
    STDOUT.puts(message)
  end

  def to_s
    'stdout'
  end
end
