require 'yaml'
require_relative './channel'
require_relative './subscriber'
require_relative './senders/builder'
require_relative './subscriber_builder'

module ChannelBuilder
  def self.build(channel_data)
    channel_data.each do |channel_name, data|
      channel_data[channel_name] = Channel.new(
        name: channel_name,
        subscribers: SubscriberBuilder.build_list(data['subscribers'])
      )
    end
  end
end
