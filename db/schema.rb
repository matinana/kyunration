# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_201_123_111_104) do
  create_table 'content_tags', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4', force: :cascade do |t|
    t.bigint 'content_id', null: false
    t.bigint 'tag_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[content_id tag_id], name: 'index_content_tags_on_content_id_and_tag_id', unique: true
    t.index ['content_id'], name: 'index_content_tags_on_content_id'
    t.index ['tag_id'], name: 'index_content_tags_on_tag_id'
  end

  create_table 'contents', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4', force: :cascade do |t|
    t.bigint 'curator_id', null: false
    t.integer 'type', default: 0, null: false
    t.text 'url'
    t.string 'title', default: '', null: false
    t.text 'comment'
    t.integer 'emotion', default: 0, null: false
    t.integer 'star', default: 0, null: false
    t.datetime 'viewed_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['curator_id'], name: 'index_contents_on_curator_id'
  end

  create_table 'curators', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer 'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.string 'current_sign_in_ip'
    t.string 'last_sign_in_ip'
    t.string 'confirmation_token'
    t.datetime 'confirmed_at'
    t.datetime 'confirmation_sent_at'
    t.string 'unconfirmed_email'
    t.integer 'failed_attempts', default: 0, null: false
    t.string 'unlock_token'
    t.datetime 'locked_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'provider'
    t.string 'uid'
    t.string 'username'
    t.index ['confirmation_token'], name: 'index_curators_on_confirmation_token', unique: true
    t.index ['email'], name: 'index_curators_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_curators_on_reset_password_token', unique: true
    t.index ['unlock_token'], name: 'index_curators_on_unlock_token', unique: true
  end

  create_table 'tags', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4', force: :cascade do |t|
    t.bigint 'curator_id', null: false
    t.string 'name', default: '', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[curator_id name], name: 'index_tags_on_curator_id_and_name', unique: true
    t.index ['curator_id'], name: 'index_tags_on_curator_id'
  end

  add_foreign_key 'content_tags', 'contents'
  add_foreign_key 'content_tags', 'tags'
  add_foreign_key 'contents', 'curators'
  add_foreign_key 'tags', 'curators'
end
