require 'spec_helper'

describe TextsController do

  let(:phone_number){}

  describe "it sends a text message" do

    xit "saves that number" do
      post :create, {phone_number: phone_number}
      expect(Text.count).to eq 1
    end
  end

  describe "it sends and receives a default text message" do

    context "when a user sends a message to the application" do

      it "will send back a general response" do
      end
    end
  end
end
