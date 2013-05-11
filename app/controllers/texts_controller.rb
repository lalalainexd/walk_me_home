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

  def input
    # @text = Text.create(phone_number: '9702708047')

    # Text.respond_to('9702708047')

    Text.send_text_message('9702708047')
  end
end 