# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.new(username: "Dummy User 1", password: "Password123", password_confirmation: "Password123").save
User.new(username: "Dummy User 2", password: "Password123", password_confirmation: "Password123").save
User.new(username: "Dummy User 3", password: "Password123", password_confirmation: "Password123").save
100.times do
	title = rand(36**5).to_s(26)+ " "+rand(36**6).to_s(26)
	content = rand(36**10).to_s(26)+ " "+rand(36**10).to_s(26) + " "+rand(36**50).to_s(26)+ " "+rand(36**50).to_s(26)
	author_ip = rand(223).to_s(10)+"."+rand(223).to_s(10)+"."+rand(223).to_s(10)+"."+rand(223).to_s(10)
	user_id = [1,2,3].shuffle.first
    Post.new(title: title, content: content, author_ip: author_ip, user_id: user_id).save
end