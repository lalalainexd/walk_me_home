require 'spec_helper'

describe TextsController do 

  let(:starting_trip){ {
                        :From => "10000000",
                        :Body => "Starting trip of 20 minutes"
                      } }


  describe "receiving a text message" do 

    context "a user is not registered" do 

      it "tells the user to register before starting a trip" do 
        post :input, starting_trip
        (Text).should_receive(:send_text).with("Please register before using this application")
      end

      context "a user is registered" do 

        it "regiseres the user for the trip" do 
        end
      end
    end

    context "a user cancelles a trip" do 
    end

    context "a user ends a trip when prompted" do 
    end
  end
end