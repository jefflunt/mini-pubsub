module MiniPubSub
  class UnknownReceiverType < StandardError
    def initialize(type)
      super("Unknown receiver type '#{type}'")
    end
  end
end
