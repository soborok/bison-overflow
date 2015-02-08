# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

name = ["test", "philpp", "adriana", "shea", "heejin"]
index = 0
5.times do
	User.create(email: "#{name[index]}@test.com", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, password: "test")	
	index += 1
end

10.times do 
	Question.create(user_id: rand(1..5), title: Faker::Commerce.product_name, content: Faker::Lorem.paragraph)
end

30.times do
	Answer.create(user_id: rand(1..5), question_id: rand(1..10), content: Faker::Lorem.paragraph)
end
