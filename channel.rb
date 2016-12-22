class Channel
  attr_reader :name, :subscribers

  def initialize(name:, subscribers:)
    @name = name
    @subscribers = Set.new(subscribers)
  end

  def publish(message)
    @subscribers.each { |s| s.puts(message) }
  end
end
