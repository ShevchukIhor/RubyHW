5.times do
  Category.create({ title: Faker::Games::WorldOfWarcraft.class_name })
end
# without images
10.times do
  Product.create({ name: Faker::Games::WorldOfWarcraft.hero,
                   description: Faker::Games::WorldOfWarcraft.quote, price: rand(1..101), category_id: rand(6) })
end

# this section for product with random image from internet(need internet connection)
=begin
10.times do
  Product.create({ name: Faker::Games::WorldOfWarcraft.hero,
  description: Faker::Games::WorldOfWarcraft.quote, price: rand(0..101), image: Faker::LoremFlickr.image(size: "#{rand(100..200)}x200", search_terms: %w[games warcraft]), category_id: rand(6) })
end
=end


User.create!(email: 'user@example.com', password: 'password', password_confirmation: 'password')
User.create!(email: 'user2@example.com', password: 'password', password_confirmation: 'password')
User.create!(email: 'user3@example.com', password: 'password', password_confirmation: 'password')
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
