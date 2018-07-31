class Message
  attr_reader :command, :channel, :body

  def initialize(sanitized_input_str)
    @command, @channel, @body = sanitized_input_str.split(' ', 3)
  end

  def to_s
    [command, channel, body].join(' ')
  end
end
