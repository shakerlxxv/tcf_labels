class CreateLabelDataSets < ActiveRecord::Migration
  def self.up
    create_table :label_data_sets do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :label_data_sets
  end
end
