class TripsController < ApplicationController

  def create
    trip = NewTripRequestProcessor.new_trip(requestor, duration)
    trip.begin
  end

  def process_request requestor, request, duration
    trip = NewTripRequestProcessor.new_trip(requestor, duration)
    trip.begin
  end

end
