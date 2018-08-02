module Senders
  class STDOUT
    def initialize(destination)
      super(destination)
    end

    def publish(message)
      STDOUT.puts(message)
    end

    def to_s
      'stdout'
    end
  end
end
