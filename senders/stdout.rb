module Senders
  class STDOUT
    def initialize(destination)
    end

    def publish(message)
      puts(message)
    end

    def to_s
      'stdout'
    end
  end
end
