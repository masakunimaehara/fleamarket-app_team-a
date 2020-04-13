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

ActiveRecord::Schema.define(version: 2020_04_13_135905) do

  create_table "addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "postal_code", null: false
    t.string "prefectures", null: false
    t.string "municipality", null: false
    t.string "block_number", null: false
    t.string "building"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "brands", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "brand_list", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cards", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id"
    t.string "customer_id"
    t.string "card_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "ancestry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "evaluations", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id", null: false
    t.text "text"
    t.integer "rank", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_evaluations_on_user_id"
  end

  create_table "goods", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_images", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "item_id", null: false
    t.string "image", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_item_images_on_item_id"
  end

  create_table "items", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.text "description_item", null: false
    t.integer "category_id", null: false
    t.integer "parent_category_id", null: false
    t.integer "children_category_id", null: false
    t.integer "brand_id", null: false
    t.integer "condition_id", null: false
    t.integer "shipping_charger_id", null: false
    t.integer "shipping_method_id", null: false
    t.integer "ship_from_id", null: false
    t.integer "shipping_days_id", null: false
    t.integer "price", null: false
    t.integer "sales_fee", null: false
    t.integer "sales_profit", null: false
    t.integer "seller_id", null: false
    t.integer "buyer_id"
    t.integer "auction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["auction_id"], name: "index_items_on_auction_id"
    t.index ["buyer_id"], name: "index_items_on_buyer_id"
    t.index ["category_id"], name: "index_items_on_category_id"
    t.index ["children_category_id"], name: "index_items_on_children_category_id"
    t.index ["parent_category_id"], name: "index_items_on_parent_category_id"
    t.index ["seller_id"], name: "index_items_on_seller_id"
  end

  create_table "to_dos", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "first_name"
    t.string "family_name"
    t.string "first_name_reading"
    t.string "family_name_reading"
    t.string "nickname"
    t.text "self_introduction"
    t.string "email", default: "", null: false
    t.string "phone_number"
    t.string "password", default: "", null: false
    t.date "birthday", null: false
    t.string "avatar"
    t.string "encrypted_password"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_transacts", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "transact_buyer_id", null: false
    t.integer "transact_saler_id", null: false
    t.text "transact_comment"
    t.integer "trans_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["transact_buyer_id"], name: "index_users_transacts_on_transact_buyer_id"
    t.index ["transact_saler_id"], name: "index_users_transacts_on_transact_saler_id"
  end

  add_foreign_key "evaluations", "users"
  add_foreign_key "item_images", "items"
  add_foreign_key "items", "categories"
  add_foreign_key "items", "categories", column: "children_category_id"
  add_foreign_key "items", "categories", column: "parent_category_id"
  add_foreign_key "items", "users", column: "auction_id"
  add_foreign_key "items", "users", column: "buyer_id"
  add_foreign_key "items", "users", column: "seller_id"
  add_foreign_key "users_transacts", "users", column: "transact_buyer_id"
  add_foreign_key "users_transacts", "users", column: "transact_saler_id"
end
