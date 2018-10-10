# frozen_string_literal: true

user_id = lambda {
  user = User.last

  return user.id if user

  return FactoryBot.create(:user).id
}
product_id = lambda {
  product = Product.last

  return product.id if product

  return FactoryBot.create(:product).id
}

FactoryBot.define do
  factory :comment do
    body { Faker::Lorem.paragraph(2) }
    user_id { user_id.call }
    product_id { product_id.call }
  end
end
