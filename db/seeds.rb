# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Create users and recipes'

first_user = User.new(
  username: 'Bobie',
  email: 'bobie@gmail.com',
  password: 'bobie2022'
)

first_user.save

first_recipe = Recipe.new(
  name: 'chocolate cake',
  food_type: 'dessert',
  ingredient: '3 eggs, 200 grams chocolate, 100 grams sugar, 150 grams butter, 200 grams wheat, salt',
  food_recipe: 'first mix the sugar and the eggs then add the wheat, meanwhile make the butter melt, add it with the salt',
  baking_temperature: 180,
  preparation_time: 40,
  cooking_time: 20,
  user_id: 1,
)

first_recipe.save

second_recipe = Recipe.new(
  name: 'pasta salad',
  food_type: 'pasta',
  ingredient: 'orecchiette, ricotta, cherry tomatoes, black olives, basilic, oil, pepper',
  food_recipe: 'first boil the pasta, then cut the cherry tomatoes, add the remaining ingredients, serve cold',
  preparation_time: 20,
  cooking_time: 10,
  user_id: 1,
)

second_recipe.save

puts 'one user and one recipe created'
