require 'spec_helper'

describe TextsController do

  let!(:user) {User.create( full_name: "Yoyo", 
                            email: "yoyo@email.com", 
                            phone_number: "19702008000",
                            password: "password" 
                            )}

  let(:starting_trip){ {
                        :From => "10000000000",
                        :Body => "Starting trip of 20 minutes"
                      } }


  before do 
    Text.stub(:message).and_return(true)
  end

  describe "receiving a text message" do 

    context "a user is not registered" do 

      it "tells the user to register before starting a trip" do 
        post :input, starting_trip
        user = User.find_by_phone_number("10000000000")
        expect(user).to be_nil 
      end
    end

    context "a user is registered" do 

      it "starts a trip for that user" do 
        (Text).should_receive(:start)
        post :input, { :From => user.phone_number, :Body => "Start trip of 20 minutes"}
      end
    end

    context "a user cancelles a trip" do 

      it "cancelles the user's current trip" do 
        (Text).should_receive(:cancel)
        post :input, { :From => user.phone_number, :Body => "Cancel trip"}
      end
    end

    context "a user extends a trip" do 

      it "extends that trip" do 
        (Text).should_receive(:extend_trip)
        post :input, { :From => user.phone_number, :Body => "Extend 10"}
      end
    end

    context "a user ends a trip when prompted" do 

      it "ends the trip" do 
        (Text).should_receive(:final)
        post :input, { :From => user.phone_number, :Body => "Yes"}
      end
    end

    context "a user enters an unknown command" do 

      it "responds and asks the user to re-enter their command" do 
        (Text).should_receive(:unknown)
        post :input, { :From => user.phone_number, :Body => "Apple Orange!!"}
      end
    end
  end
end
