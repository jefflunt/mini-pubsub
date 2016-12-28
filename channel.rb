require 'set'
require 'yaml'

class Channel
  attr_reader :name, :logger, :subscribers

  def initialize(name:, logger:, subscribers:)
    @name = name
    @logger = logger
    @subscribers = Set.new(subscribers)
  end

  def add_subscriber(sub)
    subscribers << sub
  end

  def publish(message)
    subscribers.each{ |s| s.puts(message) }
  end

  def to_yaml
    subs = {}
    subscribers.each{ |sub| subs[sub.id.to_s] = sub.sender.to_s }

    {
      name => {
        'logger' => logger.to_s,
        'subscribers' => subs
      }
    }.to_yaml
  end
end
