require 'spec_helper'

describe TextsController do 

  let(:phone_number){}

  describe "it sends a text message" do 

    it "will send a hello world text message" do 
      post :new, {phone_number: phone_number}
      expect(assigns(:phone_number)).to eq phone_number
    end
  end

  describe "it sends and receives a default text message" do 

    context "when a user sends a message to the application" do 

      it "will send back a general response" do 
      end
    end
  end
end