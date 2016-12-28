class STDERRSender
  def puts(message)
    STDERR.puts("STDERR: #{message}")
  end

  def to_s
    'stderr'
  end
end
