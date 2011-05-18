class CreateLabelData < ActiveRecord::Migration
  def self.up
    create_table :label_data do |t|
      t.string :name
      t.string :field1
      t.string :field2
      t.string :field3
      t.string :field4
      t.string :field5
      t.string :field6
      t.string :field7
      t.string :field8
      t.string :field9
      t.string :field10
      t.string :field11
      t.string :field12
      t.integer :label_data_set_id

      t.timestamps
    end
  end

  def self.down
    drop_table :label_data
  end
end
