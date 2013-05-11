class TripsController < ApplicationController
  def create
    @trip = current_user.start_trip(params[:duration].to_i)

    if @trip
      flash.notice = "Your trip has begun!"
      redirect_to @trip
    else
      flash.alert = "Your trip could not be created"
      redirect_to current_user
    end

  end

  def show
    @trip = current_user.trips.find_by_id(params[:id])
  end
end
