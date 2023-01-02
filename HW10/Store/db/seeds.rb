# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

10.times do
  Product.create({ name: Faker::Games::WorldOfWarcraft.hero, description: Faker::Games::WorldOfWarcraft.quote, price: rand(101), image: Faker::LoremFlickr.image(size: "#{rand(100..200)}x200", search_terms: ['games', 'warcraft']), category_id: rand(6) })
end

=begin
5.times do
  Category.create({title: Faker::Games::WorldOfWarcraft.class_name})
end
=end


#User.create!(email: 'user@example.com', password: 'password', password_confirmation: 'password')
#AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

