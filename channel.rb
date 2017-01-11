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
    logger.publish(message)
    subscribers.each do |s|
      begin
        s.publish(message)
      rescue StandardError => e
        logger.publish("ERROR on ##{name}: Cannot send to #{s.id} via '#{s.sender}'. Cause: #{e}")
      end
    end
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
