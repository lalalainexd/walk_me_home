require "spec_helper"

describe EmergencyContactsController do
  describe "routing" do

    it "routes to #index" do
      get("/emergency_contacts").should route_to("emergency_contacts#index")
    end

    it "routes to #new" do
      get("/emergency_contacts/new").should route_to("emergency_contacts#new")
    end

    it "routes to #show" do
      get("/emergency_contacts/1").should route_to("emergency_contacts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/emergency_contacts/1/edit").should route_to("emergency_contacts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/emergency_contacts").should route_to("emergency_contacts#create")
    end

    it "routes to #update" do
      put("/emergency_contacts/1").should route_to("emergency_contacts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/emergency_contacts/1").should route_to("emergency_contacts#destroy", :id => "1")
    end

  end
end
