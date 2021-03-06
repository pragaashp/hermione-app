# encoding: UTF-8
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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160402192421) do

  create_table "assignments", id: false, force: :cascade do |t|
    t.integer "professor_id"
    t.integer "course_id"
  end

  add_index "assignments", ["course_id"], name: "index_assignments_on_course_id"
  add_index "assignments", ["professor_id"], name: "index_assignments_on_professor_id"

  create_table "courses", force: :cascade do |t|
    t.integer  "ccn"
    t.string   "title"
    t.string   "abbreviation"
    t.string   "location"
    t.string   "days"
    t.string   "start_time"
    t.string   "end_time"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "professors", force: :cascade do |t|
    t.string   "name"
    t.string   "department"
    t.string   "email"
    t.boolean  "request_copy", default: false
    t.boolean  "notification", default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "requests", force: :cascade do |t|
    t.text     "comments"
    t.integer  "status",     default: 0
    t.string   "format"
    t.integer  "course_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "requests", ["course_id"], name: "index_requests_on_course_id"

end
