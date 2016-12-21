class STDOUTSender
  def puts(message)
    Kernel.puts("STDOUT: #{message.meta}")
  end
end
