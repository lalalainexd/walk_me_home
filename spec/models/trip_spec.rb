require 'spec_helper'

describe Trip do
  describe "create_trip_with_duration" do

    context "with valid params" do
      let(:user) {new_user}
      let(:trip) {Trip.create_trip_with_duration(user.id, 2000)}

      it "creates a trip" do
        expect(trip).to_not be_new_record
      end

      it "creates a trip for the user" do
        expect(trip.user).to eq user
      end

      it "creates a trip with the expected_end_at" do
        expected_expected_end_at = trip.created_at + 2000
        expect(Trip.find(trip.id).expected_end_at).to eq expected_expected_end_at
      end
    end

    context "with invalid params" do

      context "with an invalid user id" do
        it "is invalid" do
          trip = Trip.create_trip_with_duration(12324, 2000)
          expect(trip).to be_invalid
        end

      end

      context "with invalid duration" do

        context "of zero" do
          let(:trip) { Trip.create_trip_with_duration(new_user.id, 0) }

          it "is invalid" do
            expect(trip).to be_invalid
          end

          it "has errors" do
            expect(trip).to have(1).error_on(:duration)
          end

        end

        context "less than zero" do
          let(:trip) { Trip.create_trip_with_duration(new_user.id, -1) }
          it "is invalid" do
            expect(trip).to be_invalid
          end

          it "has errors" do
            expect(trip).to have(1).error_on(:duration)
          end
        end
      end
    end
  end

  describe "time_up?" do

    context "time is up" do
      it "returns true" do
        trip = Trip.new
        trip.expected_end_at = Time.now - 5000

        expect(trip).to be_time_up

      end
    end

    context "time is not up" do
      it "returns true" do
        trip = Trip.new
        trip.expected_end_at = Time.now + 5000

        expect(trip).to_not be_time_up

      end
    end
  end

  def new_user
    user = User.new
    user.full_name = "John Smith"
    user.email = "john@smith.com"
    user.phone_number = "1234567890"
    user.password = "1234"
    user.password_confirmation = "1234"
    user.save!

    user
  end
end
