require 'set'
require 'yaml'

class Channel
  attr_reader :name, :subscribers

  def initialize(name:, subscribers:)
    @name = name
    @subscribers = Set.new(subscribers)
  end

  def add_subscriber(sub)
    subscribers << sub
  end

  def publish(message)
    subscribers.each do |s|
      puts "  #{s.sender} -> ##{message.channel} #{message.body}"
      s.puts(message)
    end
  end

  def to_yaml
    subs = {}
    subscribers.each{ |sub| subs[sub.id.to_s] = sub.sender.to_s }

    { name => { 'subscribers' => subs } }.to_yaml
  end
end
