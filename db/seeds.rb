# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
10.times do
  estimate = Estimate.create!(
    label: Faker::Name.name,
    date: Faker::Date.between(from: 2.days.ago, to: Date.today),
  )

  2.times do
    estimate.items.create!(
      name: Faker::Commerce.product_name,
      description: Faker::Commerce.department,
      quantity: Faker::Number.non_zero_digit,
      unit_price: Faker::Commerce.price(range: 0..10.0, as_string: true),
      vat_rate: Item::ALLOWED_VAT_RATES.sample,
    )
  end
end
