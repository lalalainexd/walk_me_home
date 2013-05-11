class TextsController < ApplicationController

  def input
    #take in the text message
    #create or find the user
    #post to start the trip
    Text.respond_to(params[:From], params[:Body] )
  end
end 