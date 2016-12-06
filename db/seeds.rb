# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Answer.destroy_all
Challenge.destroy_all
Member.destroy_all
Team.destroy_all
TeamChallenge.destroy_all
User.destroy_all
City.destroy_all


user1 = User.create!(email: "manon@lol.me", password: "FGHJKL")

brussels = City.create!(name: "Brussels", picture: 'brussels.jpeg')
paris = City.create!(name: "Paris", picture: 'paris.jpeg')
amsterdam = City.create!(name: "Amsterdam", picture: 'amsterdam.jpeg')
london = City.create!(name: "London", picture: 'london.jpeg')

challenge1 = Challenge.create!(title: "Question 1", description: "Find the good answer !", address: "123 avenue molière 1050 Belgium", score: 10, good_answer: "Pix", bad_answers: ["Pix", "Loo", "Poux"], hint: "start with P", input_type: "text", picture: "", cost: 1, gift: "Promo code 1234", city_id: brussels.id)
challenge2 = Challenge.create!(title: "Question 2", description: "Find the answer !", address: "180 avenue de floréal 1180 Belgium", score: 10, good_answer: "Pix", bad_answers: ["Pix", "Loo", "Poux"], hint: "start with P", input_type: "picture", picture: "", cost: 1, gift: "Promo code 13", city_id: brussels.id)

team1 = Team.create!(title: "Les blondes", team_picture: "", start_date: Date.today, end_date: Date.today, city_id: brussels.id)

Answer.create!(text: "bonbon", status: "Done", picture: "", team_id: team1.id, challenge_id: challenge1.id)
Answer.create!(text: "bonbon", status: "Gift", picture: "", team_id: team1.id, challenge_id: challenge2.id)



Member.create!(score: 120, user_id: user1.id, team_id: team1.id)


TeamChallenge.create!(challenge_id: challenge1.id, team_id: team1.id)



