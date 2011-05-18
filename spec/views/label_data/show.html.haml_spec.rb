require 'spec_helper'

describe "label_data/show.html.haml" do
  before(:each) do
    @label_datum = assign(:label_datum, stub_model(LabelDatum,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Field1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Field2/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Field3/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Field4/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Field5/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Field6/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Field7/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Field8/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Field9/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Field10/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Field11/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Field12/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
