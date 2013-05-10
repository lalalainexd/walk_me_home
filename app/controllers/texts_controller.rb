class TextsController < ApplicationController

  def index
    
  end

  def create

    @test = Text.create((params[:text][:phone_number]).to_s)

    Text.send_text_message(@text.phone_number)

    redirect_to text_path()
  end

  def show

  end
end 