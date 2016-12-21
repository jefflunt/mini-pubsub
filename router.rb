class Router
  def initialize(channels)
    @channels = channels
  end

  def route(message)
    puts "Msg: #{message}"
    puts "Channel name: #{message.channel}"
    puts "Channel inst: #{@channels[message.channel]}"

    @channels[message.channel].publish(message)
  end
end
