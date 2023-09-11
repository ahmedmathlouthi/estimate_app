# frozen_string_literal: true

FactoryBot.define do
  factory :estimate do
    date { Faker::Date.between(from: 2.days.ago, to: Date.today) }
    label { Faker::Company.industry }
  end
end
