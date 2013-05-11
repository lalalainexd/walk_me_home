require 'spec_helper'

describe "emergency_contacts/show" do
  before(:each) do
    @emergency_contact = assign(:emergency_contact, stub_model(EmergencyContact))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
