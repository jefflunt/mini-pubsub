class STDOUTSender
  def puts(message)
    STDOUT.puts(message)
  end

  def to_s
    'stdout'
  end
end
