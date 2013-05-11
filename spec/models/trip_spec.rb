require 'spec_helper'

describe Trip do

  describe "start" do
    it "creates a trek with default duration" do
      trek = Trek.new
      treks = []

      subject.stub(:treks).and_return(treks)
      treks.should_receive(:build).and_return(trek)
      trek.should_receive(:start)

      subject.start
    end
  end

  def new_user
    user = User.new
    user.full_name = "John Smith"
    user.email = "john@smith.com"
    user.phone_number = "1234567890"
    user.password = "1234"
    user.password_confirmation = "1234"
    user.save!

    user
  end
end
