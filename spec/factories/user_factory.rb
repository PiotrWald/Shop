# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { 'email@email.com' }
    password { '11111111' }
  end
end
