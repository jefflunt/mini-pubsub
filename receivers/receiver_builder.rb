require_relative '../errors/unsupported_receiver_type'
require_relative './stdin_receiver'
require_relative './tcp_receiver'

module ReceiverBuilder
  def self.build(receiver_spec)
    type, meta = receiver_spec.split(' ')
    puts "building ..."

    case type
    when 'stdin'  then STDINReceiver.new
    when 'tcp'    then TCPReceiver.new(meta)
    else
      raise MiniPubSub::UnsupportedReceiverType, type
    end
  end
end
