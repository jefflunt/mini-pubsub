require_relative '../errors/unknown_sender_type'
require_relative './none_sender'
require_relative './stdout_sender'
require_relative './stderr_sender'
require_relative './file_sender'
require_relative './tcp_sender'
require_relative './udp_sender'

module SenderBuilder
  BUILDER_MAPPINGS = {
    'none'   => NoneSender,
    'stdout' => STDOUTSender,
    'stderr' => STDERRSender,
    'file'   => FileSender,
    'tcp'    => TCPSender,
    'udp'    => UDPSender
  }

  def self.build(sender_spec)
    type, destination = sender_spec.split(' ')

    sender_type = BUILDER_MAPPINGS[type]
    sender_type ? sender_type.new(destination) : raise(MiniPubSub::UnknownSenderType, type)
  end
end
