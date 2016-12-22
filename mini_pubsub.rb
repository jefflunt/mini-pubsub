require_relative './config_reader'
require_relative './router'
require_relative './receivers/receiver_builder'
require_relative './errors/end_of_stdin'
require_relative './channel_serializer'

config = ConfigReader.load
router = Router.new(ChannelSerializer.read_file)
receiver = ReceiverBuilder.build(config.receiver)
puts "Receiv: #{receiver.inspect}"
puts "Router: #{router.inspect}"

begin
  loop do
    router.route(receiver.gets)
  end
rescue MiniPubSub::EndOfSTDIN, Interrupt => e
  puts "Shutdown ...\n  #{e.class.name}"
rescue => e
  puts "FAILURE\n  #{e}"
ensure
  ChannelSerializer.write_file(router.channels)
end
