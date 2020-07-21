# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Sub.destroy_all
Post.destroy_all
PostSub.destroy_all

user1 = User.create(username: "Capybara", password: "password")
user2 = User.create(username: "Waterrat", password: "password")

sub1 = Sub.create(title: "Swimming", description: "How to swim", moderator: User.find_by(username: "Capybara"))
sub2 = Sub.create(title: "Pizza", description: "How to steal pizza", moderator: User.find_by(username: "Waterrat"))

post1 = Post.create(title: "Best pizza", sub_ids: [sub1.id], author: User.find_by(username: "Waterrat"))
post2 = Post.create(title: "Rodents Unite", sub_ids: [sub2.id, sub1.id], author: User.find_by(username: "Waterrat"))

postsub1 = PostSub.create(post_id: post1.id, sub_id: [sub2.id])
postsub2 = PostSub.create(post_id: post2.id, sub_id: [sub2.id, sub1.id])
