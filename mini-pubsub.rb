require 'set'
require './message'

# script

channels_file = './channels.list'
channels = Set.new(IO.read(channels_file).split)

port = 29239
server = TCPServer.new(port)
puts "Running on #{port} ..."

begin
  loop do
    client = server.accept
    msg = Message.new(client.gets)
    channels << msg.channel
    client.close

    puts msg
  end
rescue Interrupt => i
  print "\nSaving channels list ... "
  File.open(channels_file, 'w') do |file|
    channels.each do |channel|
      file.puts channel
    end
  end

  puts 'DONE'
end
