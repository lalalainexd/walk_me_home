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

  describe "current_trek" do
    it "gets the current trek the user is on" do
      user = new_user
      user.start_trip 99999999
      trek = user.current_trek
      expect(trek).to be_in_progress
    end

  end

  describe "extend_current_trip" do
    context "currently on a trip" do
      it "extends the trek" do
        user = new_user
        user.start_trip 6000
        original_end = user.current_trek.expected_end_at
        user.extend_current_trip 1
        expect(user.current_trek.expected_end_at).to eq original_end+1
      end
    end

  end

  describe "stop_current_trip" do
    context "currently on a trip" do
      it "stops the trek" do
        user = new_user
        user.start_trip 6000
        original_end = user.current_trek.expected_end_at
        user.stop_current_trip
        expect(user.current_trek).to be_nil
      end
    end

  end

  def new_user
    user = User.new(full_name: "name",
                    email:"email@example.com",
                    phone_number:"1234567890")
    user.password = "password"
    user.password_confirmation = "password"
    user.save

    user
  end

end
