# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101102202439) do

  create_table "deliverable_types", :force => true do |t|
    t.string   "name"
    t.string   "unit_of_measure"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "deliverables", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "deliverable_type"
    t.string   "unit_of_measure"
    t.string   "complexity"
    t.decimal  "estimated_size"
    t.decimal  "estimated_effort"
    t.decimal  "estimated_production_rate"
    t.decimal  "actual_size"
    t.decimal  "actual_effort",             :default => 0.0
    t.decimal  "actual_production_rate"
    t.integer  "project_phase_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "efforts", :force => true do |t|
    t.decimal  "value",          :default => 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "deliverable_id"
    t.integer  "user_id"
    t.datetime "effort_date"
  end

  create_table "lifecycle_phases", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "sequence"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lifecycle_id"
  end

  create_table "lifecycles", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_phases", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "sequence"
    t.decimal  "total_estimated_effort"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_id"
    t.integer  "lifecycle_phase_id"
    t.decimal  "total_actuaL_effort",    :default => 0.0
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "total_estimated_effort"
    t.string   "status",                 :default => "Active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lifecycle_id"
    t.decimal  "total_actuaL_effort",    :default => 0.0
  end

  create_table "typical_deliverables", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "deliverable_type_id"
    t.string   "complexity"
    t.decimal  "estimated_size"
    t.decimal  "estimated_effort"
    t.decimal  "estimated_production_rate"
    t.integer  "lifecycle_phase_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "role"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
