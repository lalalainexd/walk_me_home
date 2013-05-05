class TripsController < ApplicationController

  def create
    user_id = params[:user_id].to_i
    duration = params[:duration].to_i
    @trip = Trip.create_trip_with_duration(user_id,duration)
    if !@trip.begin
      flash.alert = "There was a problem starting your trip"
    end
    redirect_to @trip
  end

  def show

    @trip = Trip.find_by_id(params[:id])
  end
end
