require 'spec_helper'

describe "label_data/new.html.haml" do
  before(:each) do
    assign(:label_datum, stub_model(LabelDatum,
      :name => "MyString",
      :field1 => "MyString",
      :field2 => "MyString",
      :field3 => "MyString",
      :field4 => "MyString",
      :field5 => "MyString",
      :field6 => "MyString",
      :field7 => "MyString",
      :field8 => "MyString",
      :field9 => "MyString",
      :field10 => "MyString",
      :field11 => "MyString",
      :field12 => "MyString",
      :label_data_set_id => 1
    ).as_new_record)
  end

  it "renders new label_datum form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => label_data_path, :method => "post" do
      assert_select "input#label_datum_name", :name => "label_datum[name]"
      assert_select "input#label_datum_field1", :name => "label_datum[field1]"
      assert_select "input#label_datum_field2", :name => "label_datum[field2]"
      assert_select "input#label_datum_field3", :name => "label_datum[field3]"
      assert_select "input#label_datum_field4", :name => "label_datum[field4]"
      assert_select "input#label_datum_field5", :name => "label_datum[field5]"
      assert_select "input#label_datum_field6", :name => "label_datum[field6]"
      assert_select "input#label_datum_field7", :name => "label_datum[field7]"
      assert_select "input#label_datum_field8", :name => "label_datum[field8]"
      assert_select "input#label_datum_field9", :name => "label_datum[field9]"
      assert_select "input#label_datum_field10", :name => "label_datum[field10]"
      assert_select "input#label_datum_field11", :name => "label_datum[field11]"
      assert_select "input#label_datum_field12", :name => "label_datum[field12]"
      assert_select "input#label_datum_label_data_set_id", :name => "label_datum[label_data_set_id]"
    end
  end
end
