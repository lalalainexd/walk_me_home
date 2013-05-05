class UserRequestHandler

  def process_request requestor, duration
    trip = NewTripRequestProcessor.new_trip(requestor, duration)
    trip.begin
  end

end
