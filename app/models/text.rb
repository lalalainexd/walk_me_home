class Text < ActiveRecord::Base

  def self.register(phone_number)
    message(phone_number, register_message)
  end 

  def self.start(phone_number)
    message(phone_number, start_trip_message)
  end

  def self.cancel(phone_number)
    message(phone_number, cancel_trip_message)
  end

  def self.final(phone_number)
    message(phone_number, final_message)
  end

  def self.extend_trip(phone_number, duration)
    message(phone_number, extend_trip_message(duration))
  end

  def self.unknown(phone_number)
    message(phone_number, retry_message)
  end

  def self.confirm_home(phone_number)
    message(phone_number, confirmation_message)
  end

  def self.emergency(phone_number, user_name)
    message(phone_number, alert_emergency_contact(user_name))
  end

  private

  def self.message(phone_number, body)
    client.account.sms.messages.create(
      :from => "+#{twilio_phone_number}", 
      :to => phone_number,
      :body => body )
  end

  def self.client
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

  def self.register_message
    "Please register before using this application"
  end

  def self.start_trip_message
    "Thanks! Your trip is booked"
  end

  def self.cancel_trip_message
    "Thanks, your trip has been cancelled"
  end

  def self.retry_message
    "I'm sorry, your message was unclear. Please try again."
  end

  def self.confirmation_message
    "Your trip is over. Please respond 'Yes' if you are home safely, or 'Extend' + number of minutes to extend your trip."
  end

  def self.final_message
    "Thanks for the confirmation! Looking forward to your next trip."
  end

  def self.extend_trip_message(number)
    "Thanks! Your trip has been extended by #{number} minutes"
  end

  def self.alert_emergency_contact(user_name)
    "Your friend #{user_name} has not confirmed they have arrived home"
  end
end 