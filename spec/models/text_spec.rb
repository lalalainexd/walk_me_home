require 'spec_helper'

describe Text do

  let!(:text) {Text.construct(phone_number: "19702008000")}

  describe "#construct" do 

    it "creates a new text instance" do 
      text_2 = Text.construct("19702008000")
      expect(text_2).to be_kind_of(Text)
    end
  end

  describe ".register" do 

    it "asks the sender to register" do
      (Text).any_instance.should_receive(:message)
      text.register
    end
  end

  describe ".start" do 

    it "confirms a trip is started" do 
      (Text).any_instance.should_receive(:message)
      text.start
    end
  end

  describe ".cancel" do

    it "confirms a trip is cancelled" do 
      (Text).any_instance.should_receive(:message)
      text.cancel
    end 
  end

  describe ".final" do 

    it "sends a message confirming a trip is over" do 
      (Text).any_instance.should_receive(:message)
      text.final
    end
  end

  describe ".extend_trip" do 

    it "sends a message confirming the trip has been extended" do 
      (Text).any_instance.should_receive(:message)
      text.extend_trip(5)
    end
  end

  describe ".unknown" do 

    it "sends a message stating that the command the user has entered is unknown" do 
      (Text).any_instance.should_receive(:message)
      text.unknown
    end
  end

  describe ".confirm_home" do 

    it "sends a message confirming the user has arrived home" do 
      (Text).any_instance.should_receive(:message)
      text.confirm_home
    end
  end

  describe ".emergency" do 

    it "sends a message to the user's emergency contact" do 
      (Text).any_instance.should_receive(:message)
      text.emergency("19702008001")
    end
  end
end
