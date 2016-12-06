# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
City.destroy_all

City.create!(name: "Brussels", picture: 'brussels.jpeg')
City.create!(name: "Paris", picture: 'paris.jpeg')
City.create!(name: "Amsterdam", picture: 'amsterdam.jpeg')
City.create!(name: "London", picture: 'london.jpeg')
