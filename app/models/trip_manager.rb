class TripManager

  def ended_trips
    Trip.filter_ended_trips
  end
end
