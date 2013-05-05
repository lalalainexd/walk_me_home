require 'spec_helper'

describe TripsController do

  describe "create" do

    let(:user_id) {2}
    let(:duration) {10}
    let(:trip) {Trip.new}

    before do
      Trip.should_receive(:create_trip_with_duration).with(user_id, duration).and_return(trip)
    end

    context "there are no problems beginning a trip" do

      before do
        trip.should_receive(:begin).and_return(true)
      end

      it "redirects to the trip show page" do
        post :create, {user_id: user_id, duration: duration}
        expect(response).to redirect_to(trip)
      end
    end

    context "there are problems beginning a trip" do
      before do
        trip.should_receive(:begin).and_return(false)
      end

      it "redirects to the show page" do
        post :create, {user_id: user_id, duration: duration}
        expect(response).to redirect_to(trip)
      end

      it "sets the flash message" do
        post :create, {user_id: user_id, duration: duration}
        expect(flash.alert).to_not be_nil
      end
    end

  end

  context "destroy" do
    let(:user) {User.new}
    context "the trip exists" do
      it "cancels a trip" do
        pending
       # Trip.should_receive(:cancel).with(user)
       # success = subject.process_request(requestor, :cancel)
       # expect(success).to be true
      end
    end
  end

end
