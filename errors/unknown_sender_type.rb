module MiniPubSub
  class UnknownSenderType < StandardError
    def initialize(type)
      super("Unknown sender type '#{type}'")
    end
  end
end
