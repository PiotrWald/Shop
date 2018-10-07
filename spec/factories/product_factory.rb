# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    name { Faker::Device.model_name }
    count { 10 }
    price { 500 }
    description { Faker::Lorem.paragraph(1) }
  end
end
