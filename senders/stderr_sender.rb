class STDERRSender
  def publish(message)
    STDERR.puts("STDERR: #{message}")
  end

  def to_s
    'stderr'
  end
end
