class TextsController < ApplicationController

  # Takes in User input and passes it along to the necessary actions
  def input

    phone_number = params[:From]
    message = Message.construct(params[:Body])

    return Text.register(phone_number) if user(phone_number).nil?
    
    case 
    when message.starting_trip? == true
      Text.start(phone_number)
      # post (message.duration, user.id) to create a trip
    when message.cancel_trip? == true
      Text.cancel(phone_number)
      # post to cancel the trip, include user.id
    when message.home_safely? == true
      Text.final(phone_number)
      #post to home safely, user.id
    when message.extend_trip? == true
      Text.extend_trip(phone_number, message.duration )
      #post to extend trip (message.duration, user.id) to extend the trip
    else
      Text.unknown(phone_number)
    end
  end

  private 

  def user(phone_number)
    User.find_by_phone_number(phone_number)
  end
end 
