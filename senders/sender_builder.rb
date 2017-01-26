require_relative '../errors/unknown_sender_type'
require_relative './none_sender'
require_relative './stdout_sender'
require_relative './stderr_sender'
require_relative './file_sender'
require_relative './tcp_sender'
require_relative './udp_sender'
require_relative './twilio_sms'

module SenderBuilder
  BUILDER_MAPPINGS = {
    'none'        => NoneSender,
    'stdout'      => STDOUTSender,
    'stderr'      => STDERRSender,
    'file'        => FileSender,
    'tcp'         => TCPSender,
    'udp'         => UDPSender,
    'twilio-sms'  => TwilioSMS
  }

  def self.build(sender_spec)
    parts = sender_spec.split(' ')
    type, destination = parts[0], parts[1..-1].join(' ')

    sender_type = BUILDER_MAPPINGS[type]
    sender_type ? sender_type.new(destination) : raise(MiniPubSub::UnknownSenderType, type)
  end
end
