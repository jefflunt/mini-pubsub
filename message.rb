class Message
  attr_reader :command, :channel, :meta

  # TODO: support multi-channel messages
  def initialize(sanitized_input_str)
    parts = sanitized_input_str.split(' ')
    @command = parts[0]
    @channel = parts[1][1..-1]
    @meta = parts[2..-1].join(' ')
  end

  def to_s
    "#{command} ##{channel} #{meta}"
  end
end
