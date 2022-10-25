# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

image = 'https://images.unsplash.com/photo-1649194791397-90dddfe2c1c5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80'
user1 = User.create!( name: 'Tom', photo: image, bio:'Programer', posts_counter: 0 )
user2 = User.create!( name: 'Capt Kaylo', photo: image, bio: 'Pilot', posts_counter: 0)
user3 = User.create!( name: 'Kalolo', photo: image, bio: 'Web Developer', posts_counter: 0)
user4 = User.create!( name: 'Showa', photo: image, bio: 'Accountant', posts_counter: 0)
user5 = User.create!( name: 'Lilly', photo: image, bio: 'Teacher', posts_counter: 0)

post1 = user1.posts.create!( title: 'Programmer lifestyle', text: 'I love coding', likes_counter: 0, comments_counter: 0)
post2 = user2.posts.create!( title: 'First Flight as commanding officer', text: 'I will be flying the boeing 777X as commanding officer today, feel free to join me.', likes_counter: 0, comments_counter: 0)