# frozen_string_literal: true

class CreateEstimates < ActiveRecord::Migration[7.0]
  def change
    create_table :estimates do |t|
      t.datetime :date
      t.decimal :total_amount
      t.string :label, null: false
      t.boolean :validated, default: false

      t.timestamps
    end
  end
end
