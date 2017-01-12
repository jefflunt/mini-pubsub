require_relative './none_sender'

class FileSender < NoneSender
  def initialize(destination)
    super(destination)

    @filename = destination
  end

  def publish(message)
    File.open(@filename, 'a') { |f| f.puts(message) }
  end

  def to_s
    "file #{@filename}"
  end
end
