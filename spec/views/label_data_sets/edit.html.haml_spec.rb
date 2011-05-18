require 'spec_helper'

describe "label_data_sets/edit.html.haml" do
  before(:each) do
    @label_data_set = assign(:label_data_set, stub_model(LabelDataSet,
      :name => "MyString"
    ))
  end

  it "renders the edit label_data_set form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => label_data_sets_path(@label_data_set), :method => "post" do
      assert_select "input#label_data_set_name", :name => "label_data_set[name]"
    end
  end
end
