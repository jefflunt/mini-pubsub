class Router
  attr_reader :channels

  def initialize(channels)
    @channels = channels
  end

  def route(message)
    puts "routing: #{message}"

    case message.command
    when 'pub'  then publish(message)
    when 'sub'  then send_confirmation_challenge(message.meta)
    else
      raise UnknownCommand, message.command
    end
  end

  def publish(message)
    @channels[message.channel].publish(message)
  end

  def send_confirmation_challenge(sender_spec)
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
