module MiniPubSub
  class UnknownCommand < StandardError
    def initialize(command)
      super("Unknown command '#{command}'")
    end
  end
end
