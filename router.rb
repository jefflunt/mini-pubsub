require_relative './subscriber_builder'
require_relative './errors/unknown_command'

class Router
  attr_reader :channels

  def initialize(channels)
    @channels = channels
    @confirmation_tokens = {}
  end

  def route(message)
    puts "routing: #{message}"

    case message.command
    when 'pub'          then publish(message)
    when 'sub'          then send_confirmation_challenge(message)
    when 'sub-confirm'  then confirm_subscription(message)
    else
      raise MiniPubSub::UnknownCommand, message.command
    end
  end

  def publish(message)
    @channels[message.channel].publish(message)
  end

  def send_confirmation_challenge(sub_request)
    new_sub = SubscriberBuilder.build(sender_spec: sub_request.body)
    @confirmation_tokens['1234'] = new_sub
    new_sub.puts(Message.new("confirm ##{sub_request.channel} 1234"))
  end

  def confirm_subscription(message)
    unless (sub = @confirmation_tokens[message.body]).nil?
      @channels[message.channel].add_subscriber(sub)
      @confirmation_tokens.delete(message.body)
    end
  end

  def to_s
    str = "{\n"

    @channels.each do |channel_name, channel|
      str << "  ##{channel_name}:\n"
      channel.subscribers.each do |subscriber|
        str << "    #{subscriber.id}: #{subscriber.sender}\n"
      end
    end

    str << "}"
  end
end
