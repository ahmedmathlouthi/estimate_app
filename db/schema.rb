# frozen_string_literal: true

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

ActiveRecord::Schema[7.0].define(version: 20_230_908_220_430) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'estimates', force: :cascade do |t|
    t.datetime 'date'
    t.decimal 'total_amount'
    t.string 'label'
    t.boolean 'validated', default: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'items', force: :cascade do |t|
    t.string 'name'
    t.text 'description'
    t.integer 'quantity', default: 0
    t.decimal 'unit_price', default: '0.0', null: false
    t.decimal 'total_price'
    t.decimal 'vat_rate', null: false
    t.bigint 'estimate_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['estimate_id'], name: 'index_items_on_estimate_id'
    t.check_constraint 'vat_rate = ANY (ARRAY[5.5, 10::numeric, 20::numeric])', name: 'check_valid_vat_rate'
  end

  add_foreign_key 'items', 'estimates'
end
