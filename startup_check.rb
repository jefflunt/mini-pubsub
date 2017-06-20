module StartupCheck
  def self.run
    unless ARGV.length == 1
      puts "Usage:"
      puts "  mini-pubsub.rb <path to config file>"
      exit 1
    end
  end
end
