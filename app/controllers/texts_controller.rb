class TextsController < ApplicationController

  def input
    #take in the text message
    #create or find the user
    #post to start the trip

    phone_number = params[:From]

    return Text.unregistered_user(phone_number) if user(phone_number).nil?

    # Text.respond_to(params[:From], params[:Body] )
  end

  private 

  def user(phone_number)
    User.find_by_phone_number(phone_number)
  end
end 
