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

ActiveRecord::Schema.define(version: 20150719065908) do

  create_table "messages", force: :cascade do |t|
    t.integer  "sender_id",         limit: 4
    t.integer  "recipient_id",      limit: 4
    t.text     "message",           limit: 65535
    t.boolean  "read",              limit: 1
    t.integer  "message_thread_id", limit: 4
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "payments", force: :cascade do |t|
    t.integer  "amount",         limit: 4
    t.integer  "reservation_id", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "reference_requests", force: :cascade do |t|
    t.integer  "recipient_id", limit: 4
    t.integer  "sender_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "references", force: :cascade do |t|
    t.integer  "request_id",   limit: 4
    t.text     "body",         limit: 65535
    t.string   "relationship", limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.integer  "guest_id",         limit: 4
    t.integer  "tour_id",          limit: 4
    t.date     "appointment_date"
    t.string   "status",           limit: 255
    t.integer  "guest_number",     limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "trip_id",    limit: 4
    t.integer  "user_id",    limit: 4
    t.integer  "tour_id",    limit: 4
    t.text     "body",       limit: 65535
    t.integer  "rating",     limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "tour_categories", force: :cascade do |t|
    t.integer  "tour_id",    limit: 4
    t.string   "category",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "tour_flows", force: :cascade do |t|
    t.integer  "tour_id",    limit: 4
    t.text     "flow",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "tour_photos", force: :cascade do |t|
    t.integer  "tour_id",    limit: 4
    t.string   "url",        limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "tour_prices", force: :cascade do |t|
    t.integer  "tour_id",    limit: 4
    t.integer  "number",     limit: 4
    t.integer  "price",      limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "tour_rules", force: :cascade do |t|
    t.integer  "tour_id",    limit: 4
    t.string   "name",       limit: 255
    t.text     "detail",     limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "tours", force: :cascade do |t|
    t.integer  "host_id",        limit: 4
    t.string   "name",           limit: 255
    t.text     "outline",        limit: 65535
    t.text     "description",    limit: 65535
    t.integer  "minimum_number", limit: 4
    t.integer  "maximum_number", limit: 4
    t.string   "rendezvous",     limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",      limit: 255
    t.string   "last_name",       limit: 255
    t.string   "email",           limit: 255
    t.string   "password_digest", limit: 255
    t.string   "phone_number",    limit: 255
    t.string   "sex",             limit: 255
    t.integer  "birthdate_1",     limit: 4
    t.integer  "birthdate_2",     limit: 4
    t.integer  "birthdate_3",     limit: 4
    t.text     "description",     limit: 65535
    t.string   "remember_token",  limit: 255
    t.string   "photo_url",       limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

end
