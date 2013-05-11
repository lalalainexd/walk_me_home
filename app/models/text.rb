class Text < ActiveRecord::Base

  def self.respond_to(phone_number, body)
    user = User.find_by_phone_number(phone_number)

    if user.nil?
      send_text(phone_number, register) 
    end

    #if the body includes the phrase "start trip"
      #start the trip
    #else
      #send information about specific commands needed to start the trip
    #end

    #cancel a trip
    #affirm they have arrived

  end 

  private

  def self.register
    "Please register before using this application"
  end

  def self.send_text(phone_number, body)
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
end 