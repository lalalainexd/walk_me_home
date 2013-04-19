require 'spec_helper'

describe "emergency_contacts/new" do
  before(:each) do
    assign(:emergency_contact, stub_model(EmergencyContact).as_new_record)
  end

  it "renders new emergency_contact form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", emergency_contacts_path, "post" do
    end
  end
end
