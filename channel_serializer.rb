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

  def self.write_file(channels, filename = DEFAULT_STORAGE_FILE)
    channels_output = {}

    channels.each do |channel_name, channel|
      channels_output[channel_name] = {}
      channel.subscribers.each do |sub|
        channels_output[channel_name][sub.id] = sub.sender.to_s
      end
    end

    File.open(filename, 'w') { |f| f.write(channels_output.to_yaml) }
  end
end
