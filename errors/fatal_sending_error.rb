module MiniPubSub
  class FatalSendingError < StandardError
    def initialize(cause)
      super("FatalSendingError caused by '#{cause}'")
    end
  end
end
