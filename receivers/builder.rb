require_relative '../errors/unknown_receiver_type'
require_relative './stdin'
require_relative './udp'
require_relative './tcp'
require_relative './unix'

module Receivers
  module Builder
    def self.build(receiver_spec)
      type, meta = receiver_spec.split(' ')

      case type
      when 'stdin'  then STDIN.new
      when 'udp'    then UDP.new(meta)
      when 'tcp'    then TCP.new(meta)
      when 'unix'   then UNIX.new(meta)
      else
        raise MiniPubSub::UnknownReceiverType, type
      end
    end
  end
end
