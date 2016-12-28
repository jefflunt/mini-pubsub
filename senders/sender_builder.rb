require_relative '../errors/unknown_sender_type'
require_relative './none_sender'
require_relative './stdout_sender'
require_relative './stderr_sender'
require_relative './file_sender'
require_relative './tcp_sender'

module SenderBuilder
  def self.build(sender_spec)
    type, meta = sender_spec.split(' ')

    case type
    when 'none'   then NoneSender.new
    when 'stdout' then STDOUTSender.new
    when 'stderr' then STDERRSender.new
    when 'file'   then FileSender.new(meta)
    when 'tcp'    then TCPSender.new(meta)
    else
      raise MiniPubSub::UnknownSenderType, type
    end
  end
end
