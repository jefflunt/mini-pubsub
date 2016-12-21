require_relative '../errors/end_of_stdin'
require_relative '../message'

class STDINReceiver
  def initialize
    puts 'Receiving on STDIN ...'
  end

  def gets
    raise MiniPubSub::EndOfSTDIN if ARGF.eof?
    Message.new(ARGF.gets.chomp)
  end
end
