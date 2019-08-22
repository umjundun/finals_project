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

ActiveRecord::Schema.define(version: 2019_08_22_165852) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "engagements", force: :cascade do |t|
    t.string "status"
    t.text "request"
    t.bigint "project_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_engagements_on_project_id"
    t.index ["user_id"], name: "index_engagements_on_user_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.text "mission"
    t.string "logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.float "latitude"
    t.float "longitude"
  end

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.bigint "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["organization_id"], name: "index_projects_on_organization_id"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "representatives", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "organization_id"
    t.boolean "primary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_representatives_on_organization_id"
    t.index ["user_id"], name: "index_representatives_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.string "facebook"
    t.string "twitter"
    t.string "instagram"
    t.string "linkedn"
    t.string "bio"
    t.string "github"
    t.boolean "admin", default: false
    t.boolean "developer", default: true
    t.string "photo"
    t.boolean "hibernate"
    t.bigint "organization_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["organization_id"], name: "index_users_on_organization_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "engagements", "projects"
  add_foreign_key "engagements", "users"
  add_foreign_key "projects", "organizations"
  add_foreign_key "projects", "users"
  add_foreign_key "representatives", "organizations"
  add_foreign_key "representatives", "users"
  add_foreign_key "users", "organizations"
end
