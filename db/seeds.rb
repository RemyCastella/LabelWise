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
  vegan: true
})

puts "...created #{User.first.first_name}'s profile"

puts "Creating 5 vegan food"

Food.create!({
  name: Faker::Food.unique.dish,
  calories: 540,
  protein: 12,
  carbohydrates: 25,
  fat: 5,
  vegan: true
})

Food.create!({
  name: Faker::Food.unique.dish,
  calories: 640,
  protein: 18,
  carbohydrates: 30,
  fat: 10,
  vegan: true
})

Food.create!({
  name: Faker::Food.unique.dish,
  calories: 440,
  protein: 12,
  carbohydrates: 20,
  fat: 8,
  vegan: true
})

Food.create!({
  name: Faker::Food.unique.dish,
  calories: 500,
  protein: 14,
  carbohydrates: 25,
  fat: 15,
  vegan: true
})

Food.create!({
  name: Faker::Food.unique.dish,
  calories: 670,
  protein: 19,
  carbohydrates: 21,
  fat: 15,
  vegan: true
})

puts "...created #{Food.count} foods"

puts "Creating 5 scans"

Food.all.each do |food|
  Scan.create!(user: User.first, food: food)
end

puts "...created #{Scan.count} scans"

puts "Creating 5 portions"

5.times do
  Portion.create!(
    user: User.first,
    food: Food.all.sample,
    portion_size: rand(1..5)
  )
end

puts "...created #{Portion.count} portions"
