require_relative './router'
require_relative './errors/end_of_stdin'
require_relative './channel_serializer'
require_relative './receivers/stdin_receiver'

# TODO: wrap serialization with begin/rescue
router = Router.new(ChannelSerializer.read_file)
receiver = STDINReceiver.new
puts "Router: #{router.inspect}"

begin
  loop do
    router.route(receiver.gets)
  end
rescue MiniPubSub::EndOfSTDIN, Interrupt => e
  print "Normal shutdown due to #{e.class.name}. Exiting ... "
end

# TODO: wrap serialization with begin/rescue
ChannelSerializer.write_file

puts 'DONE'
