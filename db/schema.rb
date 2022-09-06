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

ActiveRecord::Schema[7.0].define(version: 2022_09_06_112054) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accepts", force: :cascade do |t|
    t.bigint "problem_id"
    t.bigint "user_id"
    t.integer "required_volunteer"
    t.integer "totale_cost"
    t.datetime "start_date", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["problem_id"], name: "index_accepts_on_problem_id"
    t.index ["user_id"], name: "index_accepts_on_user_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", precision: nil, null: false
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
    t.string "checksum", null: false
    t.datetime "created_at", precision: nil, null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "bill_of_materials", force: :cascade do |t|
    t.bigint "material_id"
    t.integer "cost"
    t.integer "quantity"
    t.bigint "unit_of_measure_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "accept_id"
    t.index ["accept_id"], name: "index_bill_of_materials_on_accept_id"
    t.index ["material_id"], name: "index_bill_of_materials_on_material_id"
    t.index ["unit_of_measure_id"], name: "index_bill_of_materials_on_unit_of_measure_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.bigint "governorate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["governorate_id"], name: "index_cities_on_governorate_id"
  end

  create_table "coments", force: :cascade do |t|
    t.bigint "problem_id"
    t.bigint "user_id"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["problem_id"], name: "index_coments_on_problem_id"
    t.index ["user_id"], name: "index_coments_on_user_id"
  end

  create_table "confirms", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "confirmed"
    t.bigint "problem_id"
    t.bigint "user_id"
    t.index ["problem_id"], name: "index_confirms_on_problem_id"
    t.index ["user_id"], name: "index_confirms_on_user_id"
  end

  create_table "governorates", force: :cascade do |t|
    t.string "name"
    t.string "zip_cod"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "issues", force: :cascade do |t|
    t.text "desciption"
    t.string "cordinates"
    t.string "status", default: "Submitted"
    t.bigint "user_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "city_id"
    t.index ["category_id"], name: "index_issues_on_category_id"
    t.index ["city_id"], name: "index_issues_on_city_id"
    t.index ["user_id"], name: "index_issues_on_user_id"
  end

  create_table "join_issues", force: :cascade do |t|
    t.bigint "problem_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["problem_id"], name: "index_join_issues_on_problem_id"
    t.index ["user_id"], name: "index_join_issues_on_user_id"
  end

  create_table "material_supporets", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "problem_id"
    t.string "quantity"
    t.bigint "material_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["material_id"], name: "index_material_supporets_on_material_id"
    t.index ["problem_id"], name: "index_material_supporets_on_problem_id"
    t.index ["user_id"], name: "index_material_supporets_on_user_id"
  end

  create_table "materials", force: :cascade do |t|
    t.string "name"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_materials_on_category_id"
  end

  create_table "meassages", force: :cascade do |t|
    t.bigint "user_id"
    t.string "meassage"
    t.datetime "date_time", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_meassages_on_user_id"
  end

  create_table "money_types", force: :cascade do |t|
    t.string "coins"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photos", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_photos_on_user_id"
  end

  create_table "problems", force: :cascade do |t|
    t.text "desciption"
    t.string "status", default: "Submitted"
    t.bigint "user_id"
    t.bigint "category_id"
    t.bigint "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_problems_on_category_id"
    t.index ["city_id"], name: "index_problems_on_city_id"
    t.index ["user_id"], name: "index_problems_on_user_id"
  end

  create_table "supported_moneys", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "problem_id"
    t.integer "amount"
    t.bigint "money_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["money_type_id"], name: "index_supported_moneys_on_money_type_id"
    t.index ["problem_id"], name: "index_supported_moneys_on_problem_id"
    t.index ["user_id"], name: "index_supported_moneys_on_user_id"
  end

  create_table "unit_of_measures", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "user_type"
    t.boolean "accountstatu", default: true
    t.string "phone"
    t.string "username"
    t.string "password_digest"
    t.bigint "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "employee_id"
    t.boolean "supervisor", default: false
    t.string "bio"
    t.index ["city_id"], name: "index_users_on_city_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bill_of_materials", "accepts"
  add_foreign_key "confirms", "problems"
  add_foreign_key "confirms", "users"
end
