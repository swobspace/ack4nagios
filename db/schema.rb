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

ActiveRecord::Schema.define(version: 20180803131511) do

  create_table "ottrick_otrs_queues", force: :cascade do |t|
    t.string "name"
    t.integer "otrs_queue_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ottrick_tickets", force: :cascade do |t|
    t.integer "ticketfor_id"
    t.string "ticketfor_type"
    t.string "sender"
    t.integer "otrs_queue_id"
    t.string "subject", default: ""
    t.text "text"
    t.string "ticketnumber", default: ""
    t.integer "otrs_ticket_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["otrs_queue_id"], name: "index_ottrick_tickets_on_otrs_queue_id"
    t.index ["otrs_ticket_id"], name: "index_ottrick_tickets_on_otrs_ticket_id"
    t.index ["ticketfor_id"], name: "index_ottrick_tickets_on_ticketfor_id"
  end

  create_table "services", force: :cascade do |t|
    t.integer "site_id"
    t.string "host", default: ""
    t.string "service_description", default: ""
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["host"], name: "index_services_on_host"
    t.index ["service_description"], name: "index_services_on_service_description"
    t.index ["site_id"], name: "index_services_on_site_id"
  end

  create_table "sites", force: :cascade do |t|
    t.string "name", default: ""
    t.string "connection_type", default: ""
    t.string "uri", default: ""
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "otrs_queue_id"
    t.string "nagios_service_url"
    t.index ["otrs_queue_id"], name: "index_sites_on_otrs_queue_id"
  end

  create_table "wobauth_authorities", force: :cascade do |t|
    t.integer "authorizable_id"
    t.string "authorizable_type"
    t.integer "role_id"
    t.integer "authorized_for_id"
    t.string "authorized_for_type"
    t.date "valid_from"
    t.date "valid_until"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["authorizable_id"], name: "index_wobauth_authorities_on_authorizable_id"
    t.index ["authorized_for_id"], name: "index_wobauth_authorities_on_authorized_for_id"
    t.index ["role_id"], name: "index_wobauth_authorities_on_role_id"
  end

  create_table "wobauth_groups", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wobauth_memberships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "group_id"
    t.boolean "auto", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["group_id"], name: "index_wobauth_memberships_on_group_id"
    t.index ["user_id"], name: "index_wobauth_memberships_on_user_id"
  end

  create_table "wobauth_roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wobauth_users", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.text "gruppen"
    t.string "sn"
    t.string "givenname"
    t.string "displayname"
    t.string "telephone"
    t.string "active_directory_guid"
    t.string "userprincipalname"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "title", default: ""
    t.string "position", default: ""
    t.string "department", default: ""
    t.string "company", default: ""
    t.index ["reset_password_token"], name: "index_wobauth_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_wobauth_users_on_username", unique: true
  end

end
