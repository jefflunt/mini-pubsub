class Message
  attr_reader :command, :channel, :body

  def initialize(sanitized_input_str)
    parts = sanitized_input_str.split(' ')
    @command = parts[0]
    @channel = parts[1][1..-1]
    @body = parts[2..-1].join(' ')
  end

  def to_s
    "[#{command}] ##{channel} #{body}"
  end
end
