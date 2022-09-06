# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

puts "Cleaning database"
# rails db:seed:replant
Sight.destroy_all
Citytour.destroy_all
User.destroy_all

puts 'Creating 10 fake Users, Sights and Citytours...'
10.times do
  user = User.create(
    name: Faker::Name.name,
    nickname: Faker::FunnyName.name,
    email: Faker::Internet.email,
    password: Faker::FunnyName.name,
    encrypted_password: Faker::FunnyName.name,
    payment_details: Faker::Bank.account_number,
    country: Faker::Address.country,
    # language: Faker::Nation.language,
    guide: Faker::Boolean.boolean(true_ratio: 0.2)
  )
  user.save!

  # puts "User finished!"

  sight = Sight.create(
    name: Faker::Name.name,
    city: Faker::Address.city,
    address: Faker::Address.street_address,
    longitude: Faker::Address.longitude,
    latitude: Faker::Address.latitude,
    # guide_id: user.id
  )
  sight.save!

  # puts "Sight finished!"

  citytour = Citytour.create(
    name: Faker::Educator.course_name,
    overview: Faker::Lorem.words(number: 30),
    price: rand(0..100),
    # guide_id: user.id
  )
  citytour.save!

  # puts "Citytour finished!"
end
puts "All finished!"
