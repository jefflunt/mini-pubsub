module Senders
  class STDERR
    def initialize(destination)
      super(destination)
    end

    def publish(message)
      STDERR.puts("STDERR: #{message}")
    end

    def to_s
      'stderr'
    end
  end
end
