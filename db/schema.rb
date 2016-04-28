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

ActiveRecord::Schema.define(version: 20160424160708) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "czech_translations", force: :cascade do |t|
    t.integer  "english_sentence_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "display"
  end

  add_index "czech_translations", ["english_sentence_id"], name: "index_czech_translations_on_english_sentence_id", using: :btree

  create_table "english_sentences", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "lesson_id"
    t.string   "display"
  end

  add_index "english_sentences", ["lesson_id"], name: "index_english_sentences_on_lesson_id", using: :btree

  create_table "lessons", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "czech_translations", "english_sentences"
  add_foreign_key "english_sentences", "lessons"
end
