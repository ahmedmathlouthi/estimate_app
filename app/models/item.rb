# frozen_string_literal: true

class Item < ApplicationRecord
  ALLOWED_VAT_RATES = %w[5.5 10 20].freeze

  belongs_to :estimate

  validates :vat_rate,
            presence: true,
            inclusion: { in: ALLOWED_VAT_RATES.map(&:to_d) }

  validates :name, :unit_price, presence: true

  def total_price_with_vat
    total_price + (total_price * (vat_rate / 100))
  end

  def total_price
    unit_price * quantity
  end
end
