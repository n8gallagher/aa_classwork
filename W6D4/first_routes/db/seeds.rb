# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

mike = User.create([{username: 'Mean Mike'}])
vanelle = User.create([{username: 'Not Michelle'}])

hair = Artwork.create([{artist_id: 1, title: 'mike\'s hair', image_url: 'hair.png'}])
aa_logo = Artwork.create([{artist_id: 2, title: 'app academy logo', image_url: 'aa_logo.png'}])

as1 = ArtworkShare.create([{artwork_id: 1, viewer_id: 2}])
as2 = ArtworkShare.create([{artwork_id: 2, viewer_id: 1}])

c1 = Comment.create([{user_id: 1, artwork_id: 2, body: "naize logo yo!"}])
c1 = Comment.create([{user_id: 2, artwork_id: 3, body: "best hair yo!"}])