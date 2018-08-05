require 'twilio-ruby'

module Senders
  class TwilioSMS
    def initialize(destination)
      @account_sid, @auth_token, @from, @to = destination.split(' ')
    end

    def publish(msg)
      client = Twilio::REST::Client.new @account_sid, @auth_token

      client.account.messages.create({
        from: @from,
        to:   @to,
        body: msg.body
      })
    end

    def to_s
      "twilio-sms #{@account_sid} #{@auth_token} #{@from} #{@to}"
    end
  end
end
