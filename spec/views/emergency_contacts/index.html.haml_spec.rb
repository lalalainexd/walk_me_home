require 'spec_helper'

describe "emergency_contacts/index" do
  before(:each) do
    assign(:emergency_contacts, [
      stub_model(EmergencyContact),
      stub_model(EmergencyContact)
    ])
  end

  it "renders a list of emergency_contacts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
