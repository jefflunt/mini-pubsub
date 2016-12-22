module ReceiverBuilder
  def self.build(receiver_spec)
    type, meta = receiver_spec.split(' ')
    puts "building ..."

    case type
    when 'stdin' then STDINReceiver.new
    end
  end
end
