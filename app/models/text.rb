class Text 

  attr_reader :phone_number

  def initialize(phone_number)
    @phone_number = phone_number
  end

  def self.construct(phone_number)
    new(phone_number)
  end

  def register
    message(self.phone_number, register_message)
  end 

  def start
    message(self.phone_number, start_trip_message)
  end

  def cancel
    message(self.phone_number, cancel_trip_message)
  end

  def final
    message(self.phone_number, final_message)
  end

  def extend_trip(duration)
    message(self.phone_number, extend_trip_message(duration))
  end

  def unknown
    message(self.phone_number, retry_message)
  end

  def confirm_home
    message(self.phone_number, confirmation_message)
  end

  def emergency(user_name)
    message(self.phone_number, alert_emergency_contact(user_name))
  end

  private

  def message(phone_number, body)
    client.account.sms.messages.create(
      :from => "+#{twilio_phone_number}", 
      :to => phone_number,
      :body => body )
  end

  def client
    Twilio::REST::Client.new(twilio_sid, twilio_token)
  end

  def twilio_sid
    ENV["TWILIO_SID"] 
  end

  def twilio_token
    ENV["TWILIO_TOKEN"]
  end

  def twilio_phone_number
    ENV["TWILIO_PHONE_NUMBER"]
  end

  def register_message
    "Please register before using this application"
  end

  def start_trip_message
    "Thanks! Your trip is booked"
  end

  def cancel_trip_message
    "Thanks, your trip has been cancelled"
  end

  def retry_message
    "I'm sorry, your message was unclear. Please try again."
  end

  def confirmation_message
    "Your trip is over. Please respond 'Yes' if you are home safely, or 'Extend' + number of minutes to extend your trip."
  end

  def final_message
    "Thanks for the confirmation! Looking forward to your next trip."
  end

  def extend_trip_message(number)
    "Thanks! Your trip has been extended by #{number/60} minutes"
  end

  def alert_emergency_contact(user_name)
    "Your friend #{user_name} has not confirmed they have arrived home. Perhaps you should check in with them?"
  end
end 