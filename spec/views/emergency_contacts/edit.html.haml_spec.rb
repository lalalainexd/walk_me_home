require 'spec_helper'

describe "emergency_contacts/edit" do
  before(:each) do
    @emergency_contact = assign(:emergency_contact, stub_model(EmergencyContact))
  end

  it "renders the edit emergency_contact form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", emergency_contact_path(@emergency_contact), "post" do
    end
  end
end
