# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110518044149) do

  create_table "label_data", :force => true do |t|
    t.string   "name"
    t.string   "field1"
    t.string   "field2"
    t.string   "field3"
    t.string   "field4"
    t.string   "field5"
    t.string   "field6"
    t.string   "field7"
    t.string   "field8"
    t.string   "field9"
    t.string   "field10"
    t.string   "field11"
    t.string   "field12"
    t.integer  "label_data_set_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "label_data_sets", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "excel_data"
  end

end
