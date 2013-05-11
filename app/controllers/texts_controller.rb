class TextsController < ApplicationController

  def input
    #take in the text message
    #create or find the user
    #post to start the trip

    phone_number = params[:From]
    message = params[:Body]

    return Text.unregistered_user(phone_number) if user(phone_number).nil?

    if message.starting_trip?
      # post (message.duration, user.id) to create a trip
    elsif message.cancel_trip?
      # post to cancel the trip
    else
    end

    # Text.respond_to(params[:From], params[:Body] )
  end

  private 

  def user(phone_number)
    User.find_by_phone_number(phone_number)
  end
end 
