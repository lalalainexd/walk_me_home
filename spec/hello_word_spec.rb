require 'spec_helper'


describe "it can register a user" do

  context "when someone registers for the application" do 

    context "it stores a user's personal information" do 

      it "stores their information" do 
      end

      it "allows them to sign in at another time" do 
      end 

      it "links their phone number to their account when they send a message to the application" do 
      end
    end

    context "it stores a user's emergancy contacts" do 

      it "prompts the user to enter at least three emergancy contacts" do 
      end

      it "saves the contact's names" do 
      end

      it "saves the contact's emails" do 
      end

      it "it saves the contact's phone number"
    end
  end
end

describe "it sends a explanation of its services to a newly-registered user" do 

  context "when a new user signs up for the application" do 

    it "sends a one-time message that expains to the user how to use the app" do 
    end
  end
end

describe "it sends a confirmation when a user starts their walk home" do 

  context "when someone sends a message signaling they are starting their walk home" do 

    it "sends a confirmation that it has received and stored that information" do 
    end

    it "stores the data" do 
    end

    it "starts the timer for the amount of time the user has specified" do 
    end
  end
end 

describe "it sends a message when the user is supposed to arrive home" do 

  context "when the time has arrived that the user has specified they should arrive home" do 

    it "will send a message to the user asking whether they have arrived home" do 
    end 

    it "will expect the user to confirm they have arrived home within five minutes" do 
    end

    it "will re-send the message within five minutes if they user does not respond" do 
    end
  end

  context "the user responds to the message confirming they have arrived home" do 

    it "sends a confirmation and ends the session" do 
    end
  end

  context "the user does not respond to the final message asking whether they havea arrived home" do 

    it "sends an alert to the users pre-determined contact" do 
    end

    it "expects a confirmation from the contact they have received the message" do 
    end

    it "continues to send the message until it receives confirmation" do 
    end
  end
end


