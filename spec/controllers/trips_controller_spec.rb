require 'spec_helper'

describe TripsController do

  let(:user) {User.new}

  before do
    controller.stub(:current_user).and_return(user)
  end

  describe "create" do

    let(:trip) {Trip.new}

    context "there are no problems beginning a trip" do
      before do
        user.should_receive(:start_trip).with(10).and_return(trip)
        post :create, {start_trip: true, duration: "10"}
      end

      it "redirects to the trip show page" do
        expect(response).to redirect_to(trip)
      end

      it "sets the flash notice" do
        expect(flash.notice).to_not be_nil
      end
    end

    context "there are problems beginning a trip" do
      before do
        user.should_receive(:start_trip).with(10).and_return(false)
        post :create, {start_trip: true, duration: "10"}
      end

      it "redirects to the user page" do
        expect(response).to redirect_to(user)
      end

      it "sets the flash message" do
        expect(flash.alert).to_not be_nil
      end
    end

  end

  context "update" do
    let(:user) {User.new}

    context "the trip exists" do

      it "cancels a trip" do
      end
    end
  end

end
