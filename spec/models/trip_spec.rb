require 'spec_helper'

describe Trip do

  describe "start" do
    it "creates a trek with default duration" do
      now = Time.now
      Time.stub(:now).and_return(now)
      trip = Trip.new(default_duration: 60)
      trek = trip.start
      expect(trek.started_at).to eq (now)
      expect(trek.expected_end_at).to eq (now + 60)
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
