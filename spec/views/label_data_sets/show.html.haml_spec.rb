require 'spec_helper'

describe "label_data_sets/show.html.haml" do
  before(:each) do
    @label_data_set = assign(:label_data_set, stub_model(LabelDataSet,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
