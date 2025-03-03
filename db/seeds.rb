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
