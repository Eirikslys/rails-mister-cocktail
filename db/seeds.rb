# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Wiping database..."
Cocktail.destroy_all
Dose.destroy_all
Ingredient.destroy_all

require 'open-uri'
require 'json'
response = open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read
response = JSON.parse(response)
response["drinks"].each do |hash|
  Ingredient.create!(name: hash.values[0])
end

p "Ingredients seeded"
p Ingredient.all
