# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'DESTROYING DATABASE!!!'

Cocktail.destroy_all
Dose.destroy_all
Ingredient.destroy_all

puts 'Creating new article from seeds...'

Ingredient.create(name: 'lemon')
Ingredient.create(name: 'ice')
Ingredient.create(name: 'mint leaves')

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
ingredients = JSON.parse(ingredients_serialized)

40.times do
  Ingredient.create(name: ingredients['drinks'].sample['strIngredient1'])
end

puts 'All set!'
