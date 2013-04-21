class Text < ActiveRecord::Base

  attr_accessible :phone_number

  def self.send_text_message(number_to_send_to)

    twilio_sid = 
    twilio_token = 
    twilio_phone_number = 

    @twilio_client = Twilio::REST::Client.new(twilio_sid, twilio_token)

    @twilio_client.account.sms.messages.create(
      :from => "+15005550006", 
      :to => "+1#{number_to_send_to}",
      :body => "Yo yo yo! Sending a message to you at #{number_to_send_to}")
  end 

end 