require_relative './startup_check'
require_relative './config/config_reader'
require_relative './router'
require_relative './receivers/receiver_builder'
require_relative './channel_serializer'
require_relative './errors/end_of_stdin'
require_relative './errors/fatal_sending_error'


StartupCheck.run

config = ConfigReader.load(ARGV.shift)
router = Router.new(ChannelSerializer.read_file(config.channels_file))
receiver = ReceiverBuilder.build(config.receiver)
puts "Receiver: #{receiver.inspect}"
puts "Router: #{router}"

begin
  loop do
    router.route(receiver.receive)
  end
rescue MiniPubSub::FatalSendingError, MiniPubSub::EndOfSTDIN, Interrupt => e
  puts "Shutdown ... #{e.class.name}"
rescue => e
  puts "FAILURE\n  #{e}"
  puts e.backtrace
ensure
  ChannelSerializer.write_file(router.channels, config.channels_file)
end
