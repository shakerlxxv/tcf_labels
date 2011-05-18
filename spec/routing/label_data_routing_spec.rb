require "spec_helper"

describe LabelDataController do
  describe "routing" do

    it "routes to #index" do
      get("/label_data").should route_to("label_data#index")
    end

    it "routes to #new" do
      get("/label_data/new").should route_to("label_data#new")
    end

    it "routes to #show" do
      get("/label_data/1").should route_to("label_data#show", :id => "1")
    end

    it "routes to #edit" do
      get("/label_data/1/edit").should route_to("label_data#edit", :id => "1")
    end

    it "routes to #create" do
      post("/label_data").should route_to("label_data#create")
    end

    it "routes to #update" do
      put("/label_data/1").should route_to("label_data#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/label_data/1").should route_to("label_data#destroy", :id => "1")
    end

  end
end
