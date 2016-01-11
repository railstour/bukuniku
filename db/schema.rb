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

ActiveRecord::Schema.define(version: 20160111145704) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "books", force: :cascade do |t|
    t.string  "title"
    t.integer "quantity"
    t.text    "summary"
    t.integer "price"
    t.string  "author"
    t.string  "image"
  end

  create_table "order_details", force: :cascade do |t|
    t.integer  "book_id"
    t.integer  "order_id"
    t.integer  "quantity"
    t.integer  "unit_price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "order_details", ["book_id"], name: "index_order_details_on_book_id"
  add_index "order_details", ["order_id"], name: "index_order_details_on_order_id"

  create_table "orders", force: :cascade do |t|
    t.integer  "total_price"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "recipient_first_name"
    t.string   "recipient_last_name"
    t.string   "recipient_company"
    t.text     "recipient_address"
    t.string   "recipient_city"
    t.string   "recipient_postcode"
    t.string   "recipient_country"
    t.string   "recipient_province"
    t.string   "recipient_phone"
    t.string   "recipient_email"
    t.string   "billing_first_name"
    t.string   "billing_last_name"
    t.text     "billing_address"
    t.string   "billing_phone"
    t.string   "billing_email"
    t.text     "special_note"
    t.string   "co_gateway"
    t.string   "co_channel"
    t.string   "co_id"
    t.datetime "co_time"
    t.integer  "co_amount"
  end

  create_table "review_votes", force: :cascade do |t|
    t.integer  "book_id",    null: false
    t.integer  "review_id",  null: false
    t.integer  "voter_id",   null: false
    t.string   "vote",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "review_votes", ["book_id"], name: "index_review_votes_on_book_id"
  add_index "review_votes", ["review_id"], name: "index_review_votes_on_review_id"
  add_index "review_votes", ["voter_id"], name: "index_review_votes_on_voter_id"

  create_table "reviews", force: :cascade do |t|
    t.integer  "book_id",           null: false
    t.integer  "reviewer_id",       null: false
    t.decimal  "star",              null: false
    t.text     "text",              null: false
    t.integer  "replied_review_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "reviews", ["book_id"], name: "index_reviews_on_book_id"
  add_index "reviews", ["reviewer_id"], name: "index_reviews_on_reviewer_id"

  create_table "tariffs", id: false, force: :cascade do |t|
    t.string   "checkout_id",  null: false
    t.string   "fee_type",     null: false
    t.integer  "gross_amount", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "tariffs", ["checkout_id", "fee_type"], name: "index_tariffs_on_checkout_id_and_fee_type", unique: true

  create_table "users", force: :cascade do |t|
    t.string   "name",                                null: false
    t.string   "address"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
