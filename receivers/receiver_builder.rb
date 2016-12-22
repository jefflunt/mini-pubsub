require_relative '../errors/unsupported_receiver_type'

module ReceiverBuilder
  def self.build(receiver_spec)
    type, meta = receiver_spec.split(' ')
    puts "building ..."

    case type
    when 'stdin' then STDINReceiver.new
    else
      raise MiniPubSub::UnsupportedReceiverType, type
    end
  end
end
