require 'securerandom'

module SubscriberID
  def self.generate
    SecureRandom.uuid
  end
end

