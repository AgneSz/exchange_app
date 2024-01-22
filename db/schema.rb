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

ActiveRecord::Schema[7.0].define(version: 2023_11_14_084847) do
  create_table "accounts", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "currency_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["currency_id"], name: "index_accounts_on_currency_id"
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "currencies", charset: "utf8mb4", force: :cascade do |t|
    t.string "iso_code"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exchange_currency_rates", charset: "utf8mb4", force: :cascade do |t|
    t.string "currency_to", null: false
    t.string "currency_from", null: false
    t.integer "exchange_rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "settlements", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.integer "balance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_settlementss_on_account_id"
  end

  create_table "transactions", charset: "utf8mb4", force: :cascade do |t|
    t.integer "public_transaction_id"
    t.bigint "account_id", null: false
    t.integer "amount"
    t.string "status"
    t.bigint "settlement_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_transactions_on_accounts_id"
    t.index ["settlement_id"], name: "index_transactions_on_settlement_id"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "accounts", "currencies"
  add_foreign_key "accounts", "users"
  add_foreign_key "settlements", "accounts"
  add_foreign_key "transactions", "accounts"
  add_foreign_key "transactions", "settlements"
end
