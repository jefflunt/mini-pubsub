class FileSender
  def initialize(filename)
    @filename = filename
  end

  def publish(message)
    File.open(@filename, 'a') { |f| f.puts(message) }
  end

  def to_s
    "file #{@filename}"
  end
end
