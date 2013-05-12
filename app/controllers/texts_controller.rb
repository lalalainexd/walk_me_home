class TextsController < ApplicationController

  before_filter :user, only: :input

  def input

    phone_number = params[:From]
    message = Message.construct(params[:Body])
    text = Text.construct(phone_number)

    return text.register if user(phone_number).nil?

    case
    when message.starting_trip? == true
      text.start
      user.start_trip(message.duration)

    when message.cancel_trip? == true
      text.cancel
      user.stop_current_trip
    when message.home_safely? == true
      text.final
      user.stop_current_trip
    when message.extend_trip? == true
      text.extend_trip(message.duration )
      user.extend_current_trip(message.duration)
    else
      text.unknown
    end
  end

  private

  def user(phone_number=params[:phone_number])
    @user ||= User.find_by_phone_number(phone_number)
  end
end
