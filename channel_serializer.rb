require 'yaml'
require_relative './channel'
require_relative './subscriber'
require_relative './subscriber_builder'

module ChannelSerializer
  def self.read_file(filename)
    channel_data = YAML.load_file(filename)

    channel_data.each do |channel_name, data|
      channel_data[channel_name] = Channel.new(
        name: channel_name,
        subscribers: SubscriberBuilder.build_list(data['subscribers'])
      )
    end
  end

  def self.write_file(channels, filename)
    channels_output = {}

    channels.each do |channel_name, channel|
      channels_output[channel_name] = {'subscribers' => {}}
      channel.subscribers.each do |sub|
        channels_output[channel_name]['subscribers'][sub.id] = sub.sender.to_s
      end
    end

    File.open(filename, 'w') { |f| f.write(channels_output.to_yaml) }
  end
end
