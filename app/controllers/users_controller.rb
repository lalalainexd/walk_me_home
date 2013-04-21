class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = current_user
  end

  def new
    @user = User.new
  end

  def edit
    @user = current_user
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      auto_login(@user)
      redirect_to root_path, notice: 'Thanks for signing up!'
    else
      render action: 'new'
    end
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to @user, notice: 'Your account has been updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @user = current_user
    @user.destroy
  end
end
