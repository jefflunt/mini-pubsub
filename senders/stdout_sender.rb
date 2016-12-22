class STDOUTSender
  def puts(message)
    Kernel.puts("STDOUT: #{message.meta}")
  end

  def to_s
    'stdout'
  end
end
