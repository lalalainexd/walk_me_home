require 'spec_helper'

describe Message do 

  describe ".starting_trip?" do 

    context "given a message says to start a trip" do 

      it "returns true" do 
        message = Message.construct("Start trip of 20 minutes")
        expect(message.starting_trip?).to be_true
      end 
    end

    context "given a message does not say to start a trip" do 

      it "returns false" do 
        message = Message.construct("Lots of words words words")
        expect(message.starting_trip?).to be_false
      end 
    end 
  end




end 