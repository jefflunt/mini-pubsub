require_relative '../errors/unknown_sender_type'
require_relative './none'
require_relative './stdout'
require_relative './stderr'
require_relative './file'
require_relative './tcp'
require_relative './udp'
require_relative './unix'
require_relative './twilio_sms'

module Senders
  module Builder
    BUILDER_MAPPINGS = {
      'none'        => None,
      'stdout'      => STDOUT,
      'stderr'      => STDERR,
      'file'        => File,
      'tcp'         => TCP,
      'udp'         => UDP,
      'unix'        => UNIX,
      'twilio-sms'  => TwilioSMS
    }

    def self.build(sender_spec)
      parts = sender_spec.split(' ')
      type, destination = parts[0], parts[1..-1].join(' ')

      sender_type = BUILDER_MAPPINGS[type]
      sender_type ? sender_type.new(destination) : raise(MiniPubSub::UnknownSenderType, type)
    end
  end
end
