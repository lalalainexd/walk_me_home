require 'spec_helper'

describe TextsController do 

  let(:phone_number){}

  describe "it sends a text message" do 

    xit "saves that number" do 
      post :create, {phone_number: phone_number}
      expect(Text.count).to eq 1
    end
  end

  describe "receiving a text message" do 

    it "receives the message" do 
      post :input
      expect(assigns(:response)).to_not be_nil
    end
  end


  describe "it sends and receives a default text message" do 

    context "when a user sends a message to the application" do 

      xit "will send back a general response" do 
      end
    end
  end
end