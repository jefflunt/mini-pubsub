require 'socket'
require 'time'

Process.setproctitle('mini_pubsub-speed_test')

unless ARGV.length == 2
  puts 'Usage:'
  puts '  ruby speed_test.rb <file containing test message> <unix socket>'
  exit 1
end

msgs = IO.read(ARGV.shift)
sock_name = ARGV.shift
num_msgs = msgs.lines.length

retries = 0
start_time = Time.now
msgs.each_line do |msg|
  begin
    socket = UNIXSocket.new(sock_name)
    socket.write msg
    socket.close
  rescue
    retries += 1
    retry
  end
end

puts "#{'%.2f' % (num_msgs / (Time.now - start_time))}/sec, with #{retries} retries"
