# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "faker"

User.destroy_all
Food.destroy_all
Scan.destroy_all
Portion.destroy_all

puts "Creating vegan user..."

User.create!({
  email: "arnold@vegan.com",
  password: "123123",
  first_name: "Arnold",
  last_name: "Dijkhuizen",
  vegetarian: true,
  calories: 3000,
  protein: 120,
  carbohydrates: 450,
  fat: 100,
  common_allergens: ["Nut"]
})

puts "...created #{User.first.first_name}'s profile"

puts "Creating 10 food items"

10.times do
  Food.create!(
    name: Faker::Food.dish,
    calories: rand(100..600),
    protein: rand(5..30),
    carbohydrates: rand(10..100),
    fat: rand(5..30),
    sodium: rand(50..1000)
  )
end

puts "Created #{Food.count} foods"

puts "Creating portions for each day of the week"

foods = Food.all

6.times do |i|
  date = (i + 1).days.ago.to_date

  foods.sample(2).each do |food|
    Portion.create!(
      user: User.first,
      food: food,
      portion_size: rand(0.1..5.0).round(0),
      created_at: date,
      updated_at: date
    )
  end
end

puts "...created #{Portion.count} portions"
