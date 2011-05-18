require 'spec_helper'

describe "label_data_sets/index.html.haml" do
  before(:each) do
    assign(:label_data_sets, [
      stub_model(LabelDataSet,
        :name => "Name"
      ),
      stub_model(LabelDataSet,
        :name => "Name"
      )
    ])
  end

  it "renders a list of label_data_sets" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
