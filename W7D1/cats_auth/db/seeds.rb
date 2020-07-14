# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Cat.destroy_all
CatRentalRequest.destroy_all

User.create!([{username: "username", password: "password"}])
User.create!([{username: "other_user", password: "password1"}])
Cat.create!([{name: "Snuffles", color:"brown" , sex:"M", user_id: User.find_by(username: "username").id, birth_date: Date.new(2019,1,30)}])
#:cat_id, :end_date, :start_date, :status
CatRentalRequest.create!([{cat_id: Cat.find_by(name: "Snuffles").id, 
start_date: Date.new(2020,8,1),
end_date: Date.new(2020,8,30),
status: "PENDING",
user_id: User.find_by(username: "other_user").id}])