module MiniPubSub
  class UnknownConfigOption < StandardError
    def initialize(option)
      super("Unknown config option '#{option}'")
    end
  end
end
