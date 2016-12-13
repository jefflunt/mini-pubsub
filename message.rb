# A single message being sent through the pub-sub system
class Message
  attr_reader :channel, :text

  def initialize(str)
    parts = str.split(' ')
    @channel = parts[0]
    @text = parts[1..-1].join(' ')
  end

  def to_s
    "[#{channel}] #{text}"
  end
end
