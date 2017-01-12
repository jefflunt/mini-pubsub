require_relative '../errors/unknown_sender_type'
require_relative './none_sender'
require_relative './stdout_sender'
require_relative './stderr_sender'
require_relative './file_sender'
require_relative './tcp_sender'

module SenderBuilder
  def self.build(sender_spec)
    type, destination = sender_spec.split(' ')

    case type
    when 'none'   then NoneSender.new(destination)
    when 'stdout' then STDOUTSender.new(destination)
    when 'stderr' then STDERRSender.new(destination)
    when 'file'   then FileSender.new(destination)
    when 'tcp'    then TCPSender.new(destination)
    else
      raise MiniPubSub::UnknownSenderType, type
    end
  end
end
