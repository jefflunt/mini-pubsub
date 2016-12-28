class FileSender
  def initialize(filename)
    @filename = filename
  end

  def puts(message)
    File.open(@filename, 'a') { |f| f.puts(message) }
  end

  def to_s
    "file #{@filename}"
  end
end
