module SubscriberBuilder
  def self.build_list(subscriber_list)
    subscriber_list.collect { |id, sender| build(id: id, sender: sender) }
  end

  def self.build(id:, sender:)
    Subscriber.new(id: id, sender: sender)
  end
end
