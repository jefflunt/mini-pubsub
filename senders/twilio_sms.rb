require 'twilio-ruby'

class TwilioSMS < NoneSender
  def initialize(destination)
    super(destination)

		@account_sid, @auth_token, @from, @to = destination.split(' ')
    puts "destination #{destination}"
    puts "destination split: #{destination.split(' ').inspect}"
  end

  def publish(msg)
    puts "Sending: #{@account_sid} #{@auth_token} #{@from} #{@to} #{msg}"
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
