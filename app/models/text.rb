class Text < ActiveRecord::Base

  attr_accessible :phone_number

  def self.send_text_message(number_to_send_to)

    twilio_sid = 'ACa951155520555db68530c17d8e49fdb8'  
    twilio_token = 'cbe3c65f7c52f35d53cfbf5ed86d9d1a'
    twilio_phone_number = '9706394488'

    @twilio_client = Twilio::REST::Client.new(twilio_sid, twilio_token)

    @twilio_client.account.sms.messages.create(
      :from => "+15005550006", 
      :to => "+1#{number_to_send_to}",
      :body => "Yo yo yo! Sending a message to you at #{number_to_send_to}")
  end 

end 