require_relative './startup_check'
require_relative './config/config_reader'
require_relative './router'
require_relative './receivers/builder'
require_relative './channel_builder'
require_relative './errors/end_of_stdin'
require_relative './errors/fatal_sending_error'

Process.setproctitle('mini_pubsub')

StartupCheck.run

config = ConfigReader.load(ARGV.shift)
router = Router.new(ChannelBuilder.build(config.channels))
receiver = Receivers::Builder.build(config.receiver)
puts "Receiver: #{receiver.inspect}"
puts "Router:\n#{router.to_s.lines.collect{|l| "  #{l}"}.join}"

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
  receiver.cleanup
end
