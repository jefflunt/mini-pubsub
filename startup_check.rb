module StartupCheck
  def self.run
    check_args
  end

  def self.check_args
    if ARGV.length != 1
      puts "Usage:"
      puts "  mini-pubsub.rb <path to config file>"
      exit 1
    end
  end
end
