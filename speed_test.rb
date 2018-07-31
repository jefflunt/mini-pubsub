require 'socket'
require 'time'

if ARGV.length != 1
  puts 'Usage:'
  puts '  ruby speed_test.rb <file containing test message>'
  exit 1
end

large_string = IO.read(ARGV.shift)
msg = "pub stdout #{large_string}\n"

retries = 0
iterations = 100_000
start_time = Time.now
iterations.times do |i|
  begin
    socket = UNIXSocket.new('/tmp/mini-pubsub.sock')
    socket.write msg
    socket.close
  rescue
    retries += 1
    retry
  end
end

puts "#{'%.2f' % (iterations / (Time.now - start_time))}/sec, with #{retries} retries"
