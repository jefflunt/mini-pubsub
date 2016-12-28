require 'yaml'
require_relative './channel'
require_relative './subscriber'
require_relative './senders/sender_builder'
require_relative './subscriber_builder'

module ChannelSerializer
  def self.read_file(filename)
    channel_data = YAML.load_file(filename)

    channel_data.each do |channel_name, data|
      channel_data[channel_name] = Channel.new(
        name: channel_name,
        logger: SenderBuilder.build(data['logger']),
        subscribers: SubscriberBuilder.build_list(data['subscribers'])
      )
    end
  end

  def self.write_file(channels, filename)
    File.open(filename, 'w') do |f|
      channels.each{ |channel_name, channel| f.write(channel.to_yaml) }
    end
  end
end
