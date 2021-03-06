require_relative '../errors/end_of_stdin'
require_relative '../message'

module Receivers
  class STDIN
    def initialize
      puts 'Receiving on STDIN ...'
    end

    def receive
      raise MiniPubSub::EndOfSTDIN if ARGF.eof?
      Message.new(ARGF.gets.chomp)
    end

    def cleanup
    end
  end
end
