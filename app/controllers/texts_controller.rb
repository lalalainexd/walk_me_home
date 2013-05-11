class TextsController < ApplicationController

  def input

    phone_number = params[:From]
    message = Message.construct(params[:Body])
    text = Text.construct(phone_number)

    return text.register if user(phone_number).nil?
    
    case 
    when message.starting_trip? == true
      text.start
      # post (message.duration, user.id) to create a trip
    when message.cancel_trip? == true
      text.cancel
      # post to cancel the trip, include user.id
    when message.home_safely? == true
      text.final
      #post to home safely, user.id
    when message.extend_trip? == true
      text.extend_trip(message.duration )
      #post to extend trip (message.duration, user.id) to extend the trip
    else
      text.unknown
    end
  end

  private 

  def user(phone_number)
    User.find_by_phone_number(phone_number)
  end
end 
