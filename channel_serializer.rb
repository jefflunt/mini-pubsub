require 'yaml'
require_relative './channel'
require_relative './subscriber'
require_relative './subscriber_builder'

module ChannelSerializer
  DEFAULT_STORAGE_FILE = './channels.yml'

  def self.read_file(filename = DEFAULT_STORAGE_FILE)
    channel_data = YAML.load_file(filename)

    channel_data.each do |channel_name, subs_list|
      channel_data[channel_name] = Channel.new(
        name: channel_name,
        subscribers: SubscriberBuilder.build_list(subs_list)
      )
    end
  end

  def self.write_file(filename = DEFAULT_STORAGE_FILE)
    puts 'serializing channels is not yet don'
  end
end
