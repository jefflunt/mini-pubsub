require_relative '../errors/unknown_receiver_type'
require_relative './stdin_receiver'
require_relative './tcp_receiver'

module ReceiverBuilder
  def self.build(receiver_spec)
    type, meta = receiver_spec.split(' ')

    case type
    when 'stdin'  then STDINReceiver.new
    when 'tcp'    then TCPReceiver.new(meta)
    else
      raise MiniPubSub::UnknownReceiverType, type
    end
  end
end
