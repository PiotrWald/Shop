# frozen_string_literal: true

10.times do
  Product.create(
    name: Faker::Device.unique.model_name,
    count: rand(20),
    price: rand(100) * 10,
    description: 'Product of ' + Faker::Device.manufacturer + "\n" + Faker::Lorem.sentence(10)
    )
end

p 'created 10 devices...'

15.times do
  Product.create(
    name: Faker::Appliance.unique.equipment,
    count: rand(20),
    price: rand(100) * 10,
    description: 'Product of ' + Faker::Appliance.brand + "\n" + Faker::Lorem.sentence(10)
    )
end

p 'created 15 appliances...'
