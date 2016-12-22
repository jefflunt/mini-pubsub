module MiniPubSub
  class UnsupportedReceiverType < StandardError
    def initialize(type)
      super("Unsupported receiver type '#{type}'")
    end
  end
end
