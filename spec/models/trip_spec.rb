require 'spec_helper'

describe Trip do
  describe "create_trip_with_duration" do

    context "with valid params" do
      it "creates a trip for the user" do
        user = new_user
        Trip.create_trip_with_duration(user.id, 
      end
      it "creates a trip with the expect_end_time"
    end

    context "with invalid params" do
      context "with an invalid user id"
      context "with invalid duration"
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
