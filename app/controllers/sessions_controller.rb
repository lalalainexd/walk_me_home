class SessionsController < ApplicationController
  def new
  end

  def create
    user = login(params[:session][:email], params[:session][:password])
    if user
      redirect_back_or_to root_url, :notice => 'Logged in!'
    else
      flash.now.alert = 'Invalid email address or password. Try again!'
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_url, :notice => 'Logged out!'
  end
end
