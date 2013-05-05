require 'spec_helper'

describe UserRequestHandler do

  context "user starts a trip" do

    let(:requestor) {User.new}
    let(:duration) {10}
    let(:trip) {stub(:new_trip)}

    before do
      NewTripRequestProcessor.should_receive(:new_trip).with(requestor, duration).and_return(trip)
    end

    context "there are no problems creating a trip" do

      before do
        trip.should_receive(:begin).and_return(true)
      end

      it "begins a trip" do
        success = subject.process_request(requestor, duration)
        expect(success).to eq true
      end
    end

    context "there are problems creating a trip" do
      before do
        trip.should_receive(:begin).and_return(false)
      end

      it "doesn't begin a trip" do
        success = subject.process_request(requestor, duration)
        expect(success).to eq false
      end
    end

  end

  context "user cancels a trip" do
    it "cancels a trip" do
      subject.process_request
    end
  end

end
