require "spec_helper"

describe LabelDataSetsController do
  describe "routing" do

    it "routes to #index" do
      get("/label_data_sets").should route_to("label_data_sets#index")
    end

    it "routes to #new" do
      get("/label_data_sets/new").should route_to("label_data_sets#new")
    end

    it "routes to #show" do
      get("/label_data_sets/1").should route_to("label_data_sets#show", :id => "1")
    end

    it "routes to #edit" do
      get("/label_data_sets/1/edit").should route_to("label_data_sets#edit", :id => "1")
    end

    it "routes to #create" do
      post("/label_data_sets").should route_to("label_data_sets#create")
    end

    it "routes to #update" do
      put("/label_data_sets/1").should route_to("label_data_sets#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/label_data_sets/1").should route_to("label_data_sets#destroy", :id => "1")
    end

  end
end
