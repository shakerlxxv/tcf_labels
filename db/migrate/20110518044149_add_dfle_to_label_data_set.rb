class AddDfleToLabelDataSet < ActiveRecord::Migration
  def self.up
    add_column :label_data_sets, :excel_data, :string
  end

  def self.down
    drop_column :label_data_sets, :excel_data
  end
end
