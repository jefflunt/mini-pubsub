require_relative './senders/builder'

class Subscriber
  attr_reader :id, :sender

  def initialize(id:, sender_spec:)
    @id = id
    @sender = SenderBuilder.build(sender_spec)
  end

  def publish(message)
    @sender.publish(message)
  end
end
