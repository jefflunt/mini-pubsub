module SubscriberBuilder
  def self.build_list(subscriber_list)
    subscriber_list.collect { |id, sender_spec| build(id: id, sender_spec: sender_spec) }
  end

  def self.build(id:, sender_spec:)
    Subscriber.new(id: id, sender_spec: sender_spec)
  end
end
