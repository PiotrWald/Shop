# frozen_string_literal: true

10.times do
  Product.create!(
    name: Faker::Device.unique.model_name,
    count: rand(20),
    price: rand(100) * 10,
    description: 'Product of ' + Faker::Device.manufacturer + "\n" + Faker::Lorem.sentence(10)
    )
end

p 'created 10 devices...'

15.times do
  Product.create!(
    name: Faker::Appliance.unique.equipment,
    count: rand(20),
    price: rand(100) * 10,
    description: 'Product of ' + Faker::Appliance.brand + "\n" + Faker::Lorem.sentence(10)
    )
end

p 'created 15 appliances...'

user = FactoryBot.build(:user)
user.email = 'commenter@test.com'
user.save!

Product.all.each do |product|
  10.times do
    Comment.create!(
      body: Faker::Lorem.paragraph(2),
      user_id: user.id,
      product_id: product.id
    )
  end
end

p 'created 10 comments for each product'

5.times do
  Tag.create!( body: Faker::Lorem.word )
end

p 'created 5 tags'

tags = Tag.all
Product.all.each do |product|
  tags_to_insert = tags.sample(2)
  product.tags << tags_to_insert[0]
  product.tags << tags_to_insert[1]
end

p 'Added tags to products'
