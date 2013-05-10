class TripsController < ApplicationController
  def create
   # @trip = Trip.create_with_duration(params)
   # if @trip.current_trek
   #   # redirect to started page
   # else
   #   # redirect to trip show
   # end

    if params[:start_trip]
      @trip = Trip.create_and_start_trip_with_duration(user_id,duration)
    else
      @trip = Trip.create(user_id, duration)
    end

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
