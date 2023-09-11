# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description
      t.integer :quantity, default: 0
      t.decimal :unit_price, null: false, default: 0.00
      t.decimal :total_price
      t.decimal :vat_rate, null: false
      t.references :estimate, null: false, foreign_key: true

      t.timestamps
    end

    # Add a check constraint to the 'vat_rate' column
    execute <<-SQL
      ALTER TABLE items
      ADD CONSTRAINT check_valid_vat_rate
      CHECK (vat_rate IN (5.5, 10, 20))
    SQL
  end
end
