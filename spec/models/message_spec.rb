require 'spec_helper'

describe Message do 

  describe ".starting_trip?" do 

    context "given a message says to start a trip" do 

      let(:message){ Message.construct("Start trip of 20 minutes") }

      it "returns true" do 
        expect(message.starting_trip?).to be_true
      end 
    end

    context "given a message does not say to start a trip" do 

      let(:message){ Message.construct("Lots of words words words") }

      it "returns false" do 
        expect(message.starting_trip?).to be_false
      end 
    end 
  end

  describe ".duration" do 

    context "given a message has a trip duration" do 

      let(:message){ Message.construct("Start trip of 20 minutes") }

      it "returns the trip duration" do 
        expect(message.duration).to eq "20"
      end
    end
  end

  describe ".cancel_trip?" do 

    context "given the message includes the word cancel" do

      let(:message) { Message.construct("cancel current trip")}

      it "returns true" do 
        expect(message.cancel_trip?).to be_true
      end 
    end

    context "given the message does not include the word cancel" do 

      let(:message){ Message.construct("Lots of words words words") }

      it "returns false" do 
        expect(message.cancel_trip?).to be_false
      end
    end
  end

  describe ".home_safely?" do 

    context "given a message affirms a user is home safe" do 

      let(:message) { Message.construct("Yes") }

      it "returns true" do 
        expect(message.home_safely?).to be_true
      end
    end

    context "given a message does not affirm a user is home safe" do 
      
      let(:message){ Message.construct("Lots of words words words") }

      it "returns false" do 
        expect(message.home_safely?).to be_false
      end
    end
  end

  describe ".extend_trip?" do 

    context "given a message affirms to extend a trip" do

      let(:message){ Message.construct("Extend 10") }

      it "returns true" do 
        expect(message.extend_trip?).to be_true
      end 
    end

    context "given a message does not affirm to extend a trip" do 

      let(:message){ Message.construct("Lots of words words words") }

      it "returns false" do 
        expect(message.extend_trip?).to be_false
      end
    end
  end
end 