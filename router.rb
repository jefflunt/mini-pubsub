require_relative './subscriber_builder'
require_relative './errors/unknown_command'

class Router
  attr_reader :channels

  def initialize(channels)
    @channels = channels
    @confirmation_tokens = {}
  end

  def route(message)
    case message.command
    when 'pub' then publish(message)
    else
      raise MiniPubSub::UnknownCommand, message.command
    end
  end

  def publish(message)
    @channels[message.channel].publish(message) unless @channels[message.channel].nil?
  end

  def to_s
    str = "{\n"

    @channels.each do |channel_name, channel|
      str << "  ##{channel_name}:\n"
      str << "    subscribers:\n"
      channel.subscribers.each do |subscriber|
      str << "      #{subscriber.id}: #{subscriber.sender}\n"
      end
    end

    str << "}"
  end
end
