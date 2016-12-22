require_relative './senders/stdout_sender'

class Subscriber
  attr_reader :id, :sender

  def initialize(id:, sender:)
    @id = id
    @sender = case sender
              when 'stdout' then STDOUTSender.new
              else
                raise "Unknown sender: #{sender}"
              end
  end

  def puts(message)
    @sender.puts(message)
  end
end
