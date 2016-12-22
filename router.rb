class Router
  attr_reader :channels

  def initialize(channels)
    @channels = channels
  end

  def route(message)
    puts "Msg: #{message}"
    puts "Channel name: #{message.channel}"
    puts "Channel inst: #{@channels[message.channel]}"

    case message.command
    when 'pub'  then @channels[message.channel].publish(message)
    else
      raise UnknownCommand, message.command
    end
  end
end
