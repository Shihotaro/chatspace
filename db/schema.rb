# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_230_914_053_844) do
  create_table 'answers', force: :cascade do |t|
    t.string 'name'
    t.text 'content'
    t.integer 'question_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['question_id'], name: 'index_answers_on_question_id'
  end

  create_table 'favorites', force: :cascade do |t|
    t.integer 'user_id', null: false
    t.integer 'question_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['question_id'], name: 'index_favorites_on_question_id'
    t.index ['user_id', 'question_id'], name: 'index_favorites_on_user_id_and_question_id', unique: true
    t.index ['user_id'], name: 'index_favorites_on_user_id'
  end

  create_table 'questions', force: :cascade do |t|
    t.string 'name'
    t.string 'title'
    t.text 'content'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'records', force: :cascade do |t|
    t.date 'date'
    t.integer 'body_temperature'
    t.integer 'weight'
    t.integer 'body_fat_percentage'
    t.string 'condition'
    t.text 'memo'
    t.integer 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_records_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.string 'email'
    t.string 'password_digest'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'answers', 'questions'
  add_foreign_key 'favorites', 'questions'
  add_foreign_key 'favorites', 'users'
  add_foreign_key 'records', 'users'
end
