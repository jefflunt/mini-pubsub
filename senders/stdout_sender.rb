class STDOUTSender
  def puts(message)
    Kernel.puts("STDOUT: #{message}")
  end

  def to_s
    'stdout'
  end
end
