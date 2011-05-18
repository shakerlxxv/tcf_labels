require 'spec_helper'

describe "label_data/index.html.haml" do
  before(:each) do
    assign(:label_data, [
      stub_model(LabelDatum,
        :name => "Name",
        :field1 => "Field1",
        :field2 => "Field2",
        :field3 => "Field3",
        :field4 => "Field4",
        :field5 => "Field5",
        :field6 => "Field6",
        :field7 => "Field7",
        :field8 => "Field8",
        :field9 => "Field9",
        :field10 => "Field10",
        :field11 => "Field11",
        :field12 => "Field12",
        :label_data_set_id => 1
      ),
      stub_model(LabelDatum,
        :name => "Name",
        :field1 => "Field1",
        :field2 => "Field2",
        :field3 => "Field3",
        :field4 => "Field4",
        :field5 => "Field5",
        :field6 => "Field6",
        :field7 => "Field7",
        :field8 => "Field8",
        :field9 => "Field9",
        :field10 => "Field10",
        :field11 => "Field11",
        :field12 => "Field12",
        :label_data_set_id => 1
      )
    ])
  end

  it "renders a list of label_data" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Field1".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Field2".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Field3".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Field4".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Field5".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Field6".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Field7".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Field8".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Field9".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Field10".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Field11".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Field12".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
