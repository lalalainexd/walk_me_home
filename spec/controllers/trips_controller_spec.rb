require 'spec_helper'

describe TripsController do

  describe "create" do

    let(:user_id) {2}
    let(:duration) {10}
    let(:trip) {stub(:new_trip)}

    before do
      Trip.should_receive(:new_trip).with(user_id, duration).and_return(trip)
    end

    context "there are no problems creating a trip" do

      before do
        trip.should_receive(:begin).and_return(true)
      end

      it "begins a trip" do
        post :create, user_id: user_id, duration: duration
        expect(success).to eq true
      end
    end

    context "there are problems creating a trip" do
      before do
        trip.should_receive(:begin).and_return(false)
      end

      it "doesn't begin a trip" do
      pending
        success = subject.process_request(requestor, :new, duration)
        expect(success).to eq false
      end
    end

  end

  context "destroy" do
    let(:user) {User.new}
    context "the trip exists" do
      it "cancels a trip" do
        pending
        Trip.should_receive(:cancel).with(user)
        success = subject.process_request(requestor, :cancel)
        expect(success).to be true
      end
    end
  end

end
