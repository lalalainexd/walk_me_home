class Text < ActiveRecord::Base

  attr_accessible :phone_number

  def self.send_text_message(number_to_send_to)

    twilio_client.account.sms.messages.create(
      :from => "+#{twilio_phone_number}", 
      :to => "+1#{number_to_send_to}",
      :body => body )
  end 

  def self.respond_to(number_to_send_to, body)

    twilio_client.account.sms.messages.create(
      :from => "+#{twilio_phone_number}", 
      :to => number_to_send_to,
      :body => body )
  end 

  private

  def self.twilio_client
    Twilio::REST::Client.new(twilio_sid, twilio_token)
  end

  def self.twilio_sid
    ENV["TWILIO_SID"] 
  end

  def self.twilio_token
    ENV["TWILIO_TOKEN"]
  end

  def self.twilio_phone_number
    ENV["TWILIO_PHONE_NUMBER"]
  end
end 