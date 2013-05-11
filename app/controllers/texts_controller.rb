class TextsController < ApplicationController

  def input
    #take in the text message
    #create or find the user
    #post to start the trip

    phone_number = params[:From]
    message = params[:Body]

    return Text.unregistered_user(phone_number) if user(phone_number).nil?

    case trip
    when message.starting_trip?
      # post (message.duration, user.id) to create a trip
    when message.cancel_trip?
      # post to cancel the trip, include user.id
    when message.home_safely?
      #post to home safely, user.id
    else
      # Text.respond_to(params[:From], retry_message )
    end
  end

  private 

  def user(phone_number)
    User.find_by_phone_number(phone_number)
  end

  def retry_message
    "I'm sorry, your message was unclear. Please try again."
  end
end 
