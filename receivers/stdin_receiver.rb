require_relative '../errors/end_of_stdin'
require_relative '../message'

class STDINReceiver
  # TODO: All receivers need to implement message sanitization, because the
  # receivers are the border component that receives raw input from the outside
  # world.
  def initialize
    puts 'Receiving on STDIN ...'
  end

  def gets
    raise MiniPubSub::EndOfSTDIN if ARGF.eof?
    Message.new(ARGF.gets.chomp)
  end
end
