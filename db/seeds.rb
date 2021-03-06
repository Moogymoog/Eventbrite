require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('users')
Attendance.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('attendances')
Event.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('events')

User.create(first_name: "Maxime", last_name: "Le Segretain", email: "mlesegret@gmail.com", password: "TEST123", description: "Je suis le Super Admin", is_admin: true)

10.times do 
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "TEST123", description: Faker::Company.bs, is_admin: false)
end

10.times do 
  Event.create(start_date: Faker::Date.forward(20), duration: 30, title: Faker::Book.title, description: Faker::ChuckNorris.fact, price: rand(1..900), location: Faker::Address.city, admin_id: 1)
end

20.times do 
  Attendance.create(stripe_customer_id: rand(1000.9999), guest_id: rand(1..10), event_id: rand(1..10))
end