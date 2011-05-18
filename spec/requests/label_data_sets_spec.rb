require 'spec_helper'

describe "LabelDataSets" do
  describe "GET /label_data_sets" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get label_data_sets_path
      response.status.should be(200)
    end
  end
end
