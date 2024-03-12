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

ActiveRecord::Schema[7.1].define(version: 2024_03_12_064726) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "buddies", force: :cascade do |t|
    t.string "email"
    t.string "hp"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_buddies_on_user_id"
  end

  create_table "collections", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_collections_on_user_id"
  end

  create_table "illnesses", force: :cascade do |t|
    t.string "name"
    t.string "cause"
    t.text "description"
    t.jsonb "treatment"
    t.string "common_names"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_url"
  end

  create_table "messages", force: :cascade do |t|
    t.string "content"
    t.bigint "offer_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["offer_id"], name: "index_messages_on_offer_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "offering_options", force: :cascade do |t|
    t.bigint "offer_id", null: false
    t.bigint "offering_plant_option_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["offer_id"], name: "index_offering_options_on_offer_id"
    t.index ["offering_plant_option_id"], name: "index_offering_options_on_offering_plant_option_id"
  end

  create_table "offers", force: :cascade do |t|
    t.string "accepted"
    t.bigint "lister_plant_id", null: false
    t.bigint "buyer_plant_id"
    t.bigint "lister_id", null: false
    t.bigint "buyer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["buyer_id"], name: "index_offers_on_buyer_id"
    t.index ["buyer_plant_id"], name: "index_offers_on_buyer_plant_id"
    t.index ["lister_id"], name: "index_offers_on_lister_id"
    t.index ["lister_plant_id"], name: "index_offers_on_lister_plant_id"
  end

  create_table "plant_illnesses", force: :cascade do |t|
    t.bigint "illness_id", null: false
    t.bigint "plant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["illness_id"], name: "index_plant_illnesses_on_illness_id"
    t.index ["plant_id"], name: "index_plant_illnesses_on_plant_id"
  end

  create_table "plant_infos", force: :cascade do |t|
    t.string "name"
    t.string "common_names"
    t.text "description"
    t.string "propagation"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "watering"
  end

  create_table "plants", force: :cascade do |t|
    t.string "nickname"
    t.boolean "listing", default: false
    t.text "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "collection_id"
    t.bigint "plant_info_id", null: false
    t.integer "watering_frequency"
    t.date "start_date"
    t.index ["collection_id"], name: "index_plants_on_collection_id"
    t.index ["plant_info_id"], name: "index_plants_on_plant_info_id"
    t.index ["user_id"], name: "index_plants_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "address"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "buddies", "users"
  add_foreign_key "collections", "users"
  add_foreign_key "messages", "offers"
  add_foreign_key "messages", "users"
  add_foreign_key "offering_options", "offers"
  add_foreign_key "offering_options", "plants", column: "offering_plant_option_id"
  add_foreign_key "offers", "plants", column: "buyer_plant_id"
  add_foreign_key "offers", "plants", column: "lister_plant_id"
  add_foreign_key "offers", "users", column: "buyer_id"
  add_foreign_key "offers", "users", column: "lister_id"
  add_foreign_key "plant_illnesses", "illnesses"
  add_foreign_key "plant_illnesses", "plants"
  add_foreign_key "plants", "collections"
  add_foreign_key "plants", "plant_infos"
  add_foreign_key "plants", "users"
end
