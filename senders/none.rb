module Senders
  class None
    def initialize(destination)
      # no destination
    end

    def publish(msg)
      nil
    end

    def to_s
      'none'
    end
  end
end
