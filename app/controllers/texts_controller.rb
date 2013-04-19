class TextsController < ApplicationController

  def index
    
  end

  def new 
    @text = Text.new
  end

  def create
    number_to_send_to = params[:phone_number]

    Text.send_text_message(number_to_send_to)

  end
end 