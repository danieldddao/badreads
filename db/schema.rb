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

ActiveRecord::Schema.define(version: 20161025130418) do

  create_table "books", force: :cascade do |t|
    t.string   "isbn",             limit: 13
    t.string   "title"
    t.string   "author"
    t.string   "publisher"
    t.text     "summary"
    t.integer  "publication_year", limit: 4
    t.string   "category"
    t.string   "edition"
    t.integer  "search_count",                default: 0
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.index ["isbn"], name: "index_books_on_isbn", unique: true
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "star",    limit: 5
    t.text    "comment"
    t.integer "book_id"
    t.integer "user_id"
    t.index ["book_id"], name: "index_reviews_on_book_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password"
    t.string   "role"
    t.string   "session_token"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
