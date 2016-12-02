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

ActiveRecord::Schema.define(version: 20161122003923) do

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
    t.string   "img",                         default: "books/default-book.png"
    t.datetime "created_at",                                                     null: false
    t.datetime "updated_at",                                                     null: false
    t.integer  "reviews_count",               default: 0
    t.index ["isbn"], name: "index_books_on_isbn", unique: true
  end

  create_table "follows", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followedUser_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["followedUser_id"], name: "index_follows_on_followedUser_id"
    t.index ["follower_id", "followedUser_id"], name: "index_follows_on_follower_id_and_followedUser_id", unique: true
    t.index ["follower_id"], name: "index_follows_on_follower_id"
  end

  create_table "interests", force: :cascade do |t|
    t.string   "genre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interests_meetings", id: false, force: :cascade do |t|
    t.integer "interest_id", null: false
    t.integer "meeting_id",  null: false
    t.index ["interest_id", "meeting_id"], name: "index_interests_meetings_on_interest_id_and_meeting_id"
    t.index ["meeting_id", "interest_id"], name: "index_interests_meetings_on_meeting_id_and_interest_id"
  end

  create_table "meetings", force: :cascade do |t|
    t.string   "name"
    t.string   "approx_time"
    t.datetime "start_time"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "meetings_interests", id: false, force: :cascade do |t|
    t.integer "meeting_id"
    t.integer "interest_id"
    t.index ["interest_id"], name: "index_meetings_interests_on_interest_id"
    t.index ["meeting_id"], name: "index_meetings_interests_on_meeting_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "star",       limit: 5
    t.text     "comment"
    t.integer  "book_id"
    t.integer  "user_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["book_id"], name: "index_reviews_on_book_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "position"
    t.string "position_code"
    t.index ["position_code"], name: "index_roles_on_position_code", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password_digest"
    t.string   "position"
    t.string   "session_token"
    t.boolean  "prime"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
