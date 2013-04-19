class Text < ActiveRecord::Base

  attr_accessible :phone_number

  def self.send_text_message(number_to_send_to)
    twilio_sid = 'ACec273bded0df58cc57967f9188eb4ab4'
    twilio_token = '8ff16c2efb2fa5478310980eae3a33a8'
    twilio_phone_number = '9706394488'

    @twilio_client = Twilio::REST::Client.new(twilio_sid, twilio_token)

    @twilio_client.account.sms.messages.create(
      :from => "+1#{twilio_phone_number}", 
      :to => number_to_send_to,
      :body => "Yo yo yo! Sending a message to you at #{number_to_send_to}")
  end 

end 