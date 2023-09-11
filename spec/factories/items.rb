# frozen_string_literal: true

FactoryBot.define do
  factory :item do
    name { Faker::Commerce.product_name }
    description { Faker::Commerce.department }
    quantity { Faker::Number.non_zero_digit }
    unit_price { Faker::Commerce.price(range: 0..10.0, as_string: true) }
    vat_rate { Item::ALLOWED_VAT_RATES.sample }
    estimate { create(:estimate) }
  end
end
