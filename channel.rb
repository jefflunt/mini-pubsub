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
      begin
        s.publish(message)
      rescue StandardError => e
        STDERR.puts "ERROR on ##{name}: Cannot send to #{s.id} via '#{s.sender}'. Cause: #{e}"
      end
    end
  end
end
