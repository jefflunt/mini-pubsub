require 'socket'
require 'time'

if ARGV.length != 1
  puts 'Usage:'
  puts '  ruby speed_test.rb <file containing test message>'
  exit 1
end

msgs = IO.read(ARGV.shift)
num_msgs = msgs.lines.length

retries = 0
start_time = Time.now
msgs.each_line do |msg|
  begin
    socket = UNIXSocket.new('/tmp/mini-pubsub.sock')
    socket.write msg
    socket.close
  rescue
    retries += 1
    retry
  end
end

puts "#{'%.2f' % (num_msgs / (Time.now - start_time))}/sec, with #{retries} retries"
