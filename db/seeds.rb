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
languages = %w(german english french spanish dutch portuguese chinese)
10.times do
  user = User.create!(
    name: Faker::Name.name,
    nickname: Faker::FunnyName.name,
    email: Faker::Internet.email,
    password: "secret",
    payment_details: Faker::Bank.account_number,
    country: Faker::Address.country,
    language_list: [languages.sample],
    guide: Faker::Boolean.boolean(true_ratio: 0.5)
  )

  # puts "User finished!"

  sight = Sight.create!(
    name: Faker::Name.name,
    city: Faker::Address.city,
    address: Faker::Address.street_address,
    longitude: Faker::Address.longitude,
    latitude: Faker::Address.latitude,
    guide: user
  )

  # puts "Sight finished!"

  citytour = Citytour.create!(
    name: Faker::Educator.course_name,
    overview: Faker::Lorem.words(number: 30).join(' '),
    price: rand(0..100),
    guide: user
  )

  # puts "Citytour finished!"
end
puts "All finished!"

puts 'Creating 10 Sights'
user = User.create!(
  name: Faker::Name.name,
  nickname: Faker::FunnyName.name,
  email: Faker::Internet.email,
  password: "secret",
  payment_details: Faker::Bank.account_number,
  country: Faker::Address.country,
  language_list: [languages.sample],
  guide: Faker::Boolean.boolean(true_ratio: 0.5)
)
sight = Sight.create!(
  name: "Schönbrunn Palace",
  city: "Vienna",
  address: "Schönbrunner Schloßstraße 47",
  longitude: 16.311865,
  latitude: 48.184517,
  guide: user
)
sight = Sight.create!(
  name: "Hofburg Palace",
  city: "Vienna",
  address: "Heldenplatz",
  longitude: 16.364763,
  latitude: 48.205532,
  guide: user
)
sight = Sight.create!(
  name: "Tiergarten Schönbrunn",
  city: "Vienna",
  address: "Maxingstraße 13b",
  longitude: 16.302778,
  latitude: 48.182222,
  guide: user
)
sight = Sight.create!(
  name: "Wiener Riesenrad",
  city: "Vienna",
  address: "Riesenradpl. 1",
  longitude: 16.395833,
  latitude: 48.216667,
  guide: user
)
sight = Sight.create!(
  name: "Albertina",
  city: "Vienna",
  address: "Albertinapl. 1",
  longitude: 16.367778,
  latitude: 48.204444,
  guide: user
)
sight = Sight.create!(
  name: "Kunsthistorisches Museum",
  city: "Vienna",
  address: "Maria-Theresien-Platz",
  longitude: 16.361667,
  latitude: 48.203611,
  guide: user
)
sight = Sight.create!(
  name: "Donauturm",
  city: "Vienna",
  address: "Donauturmplatz 1",
  longitude: 16.410833,
  latitude: 48.24,
  guide: user
)
sight = Sight.create!(
  name: "Naturhistorisches Museum",
  city: "Vienna",
  address: "Burgring 7",
  longitude: 16.359722,
  latitude: 48.205278,
  guide: user
)
sight = Sight.create!(
  name: "Schatzkammer",
  city: "Vienna",
  address: "Hofburg, Schweizerhof",
  longitude: 16.365556,
  latitude: 48.206667,
  guide: user
)
sight = Sight.create!(
  name: "Spanish Riding School",
  city: "Vienna",
  address: "Michaelerplatz 1",
  longitude: 16.366944,
  latitude: 48.206944,
  guide: user
)
puts "All finished!"
