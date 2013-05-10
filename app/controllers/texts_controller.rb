class TextsController < ApplicationController

  def index
    
  end

  def new 
    @text = Text.new
  end

  def create

    number = params[:text][:phone_number]

    @text = Text.create(phone_number: number)

    Text.send_text_message(@text.phone_number)

    redirect_to root_path
  end

  def show

  end
end 