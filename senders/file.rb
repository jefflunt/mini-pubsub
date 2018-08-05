module Senders
  class File
    def initialize(destination)
      @filename = destination
    end

    def publish(message)
      File.open(@filename, 'a') { |f| f.puts(message) }
    end

    def to_s
      "file #{@filename}"
    end
  end
end
