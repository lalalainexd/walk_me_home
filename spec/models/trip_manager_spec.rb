require 'spec_helper'

describe TripManager do

  context "ended_trips" do
    it "looks for all trips that are expected to be over" do
      trip1 = new_trip(0)
      trip2 = new_trip(-3)

      trips = [trip1, trip2]

      Trip.should_receive(:filter_ended_trips).and_return(trips)
      expect(subject.ended_trips).to eq trips
    end
  end

  def new_trip delta
    trip = Trip.new
    trip.expected_end_at = Time.now + delta
  end

end
