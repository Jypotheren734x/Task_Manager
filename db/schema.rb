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

ActiveRecord::Schema.define(version: 20170720170804) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friendships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "friend_id"
    t.boolean "accepted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "group_projects", force: :cascade do |t|
    t.bigint "group_id"
    t.bigint "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_group_projects_on_group_id"
    t.index ["project_id"], name: "index_group_projects_on_project_id"
  end

  create_table "group_tasks", force: :cascade do |t|
    t.bigint "task_id"
    t.bigint "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_group_tasks_on_group_id"
    t.index ["task_id"], name: "index_group_tasks_on_task_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "owner_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "recipient_id"
    t.string "action"
    t.string "notifiable_type"
    t.integer "notifiable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "project_tasks", force: :cascade do |t|
    t.integer "project_id"
    t.integer "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "group_id"
    t.index ["group_id"], name: "index_projects_on_group_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "priority"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "completed"
  end

  create_table "user_groups", force: :cascade do |t|
    t.bigint "group_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "accepted", default: false
    t.index ["group_id"], name: "index_user_groups_on_group_id"
    t.index ["user_id"], name: "index_user_groups_on_user_id"
  end

  create_table "user_projects", force: :cascade do |t|
    t.integer "user_id"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_tasks", force: :cascade do |t|
    t.integer "user_id"
    t.integer "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "first_name"
    t.string "last_name"
    t.string "birthday"
    t.boolean "organization"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "group_projects", "groups"
  add_foreign_key "group_projects", "projects"
  add_foreign_key "group_tasks", "groups"
  add_foreign_key "group_tasks", "tasks"
  add_foreign_key "groups", "users", column: "owner_id", name: "groups_users_id_fk"
  add_foreign_key "notifications", "users"
  add_foreign_key "project_tasks", "projects", name: "project_tasks_projects_id_fk"
  add_foreign_key "project_tasks", "tasks", name: "project_tasks_tasks_id_fk"
  add_foreign_key "projects", "groups"
  add_foreign_key "user_groups", "groups"
  add_foreign_key "user_groups", "users"
  add_foreign_key "user_projects", "projects", name: "user_projects_projects_id_fk"
  add_foreign_key "user_projects", "users", name: "user_projects_users_id_fk"
  add_foreign_key "user_tasks", "tasks", name: "user_tasks_tasks_id_fk"
  add_foreign_key "user_tasks", "users", name: "user_tasks_users_id_fk"
end
