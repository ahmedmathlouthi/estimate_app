# frozen_string_literal: true

class Estimate < ApplicationRecord
  has_many :items, dependent: :delete_all

  accepts_nested_attributes_for :items, allow_destroy: true, reject_if: :all_blank

  def total_base_amount
    items.sum(&:total_price)
  end

  def total_vat_amount
    items.sum(&:vat_rate)
  end

  def total_with_tax
    items.sum(&:total_price_with_vat)
  end
end
