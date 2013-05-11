class TextsController < ApplicationController

  # Takes in User input and passes it along to the necessary actions
  def input

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

  # Takes in Worker Input- expecing a user id and a parameter
  def output
    Text.respond_to(user.phone_number, confirmation_message)
    #send the user the message given on what the worker is responding to 
  end

  private 

  def user(phone_number)
    User.find_by_phone_number(phone_number)
  end

  def retry_message
    "I'm sorry, your message was unclear. Please try again."
  end

  def confirmation_message
    "Your trip is over. Please respond 'Yes' if you are home safely, or 'Extend' + number of minutes to extend your trip."
  end
end 
