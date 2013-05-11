require 'spec_helper'

describe User do
  describe "start trip" do
    context "starting a non existent trip" do
      it "creates and starts a new trip" do
        trip = Trip.new
        trips = []

        subject.stub(:trips).and_return(trips)
        trips.should_receive(:create).with(default_duration: 10).and_return(trip)
        trip.should_receive(:start)

        subject.start_trip 10
      end
    end
  end

end
