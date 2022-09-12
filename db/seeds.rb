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


Review.destroy_all
puts "Reviews destroyed"
Booking.destroy_all
puts "Bookings destroyed"
Citytour.destroy_all
Sight.destroy_all
User.destroy_all

puts 'Creating user'
languages = %w(german english french spanish dutch portuguese chinese)

user = User.create!(
  name: "Zack Levy",
  nickname: "Z",
  email: "zacklevy@email.com",
  password: "zlevy210",
  payment_details: "12345678910111213 01/23 056",
  country: "Israel",
  language_list: "English, Hebrew, Spanish, Thai(kitchen)",
  guide:  true,
)

traveller = User.create!(
  name: "Oliver Stoislow",
  nickname: "Ollie",
  email: "ostoi@email.com",
  password: "oliver",
  payment_details: "12345678911111213 01/23 056",
  country: "Berlin",
  language_list: "English, German(idk what else",
  guide: false
)

  # puts "User finished!"

  sight = Sight.create!(
    name: "Dead Sea",
    city: "Ein Bokek",
    address: "Ein Bokek, Israel",
    longitude: 31.2002,
    latitude: 35.3625,
    guide: user
  )

  # puts "Sight finished!"

  citytour = Citytour.create!(
    name: "Masada/Dead Sea Tour",
    overview: "Visit Masada and the Dead Sea in one day, tours leaving from Jerusalem and Tel Aviv.",
    price: rand(0..400),
    guide: user
  )

  Booking.create!(
    citytour: citytour,
    user: traveller
  )
  # puts "Citytour finished!"
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

# do not change
# 2
sight = Sight.create!(
  name: "Schönbrunn Palace",
  city: "Vienna",
  address: "Schönbrunner Schloßstraße 47",
  longitude: 16.311865,
  latitude: 48.184517,
  guide: user
)
# do not change
# 3
sight = Sight.create!(
  name: "Hofburg Palace",
  city: "Vienna",
  address: "Heldenplatz",
  longitude: 16.364763,
  latitude: 48.205532,
  guide: user
)

# do not change
# 4
sight = Sight.create!(
  name: "Tiergarten Schönbrunn",
  city: "Vienna",
  address: "Maxingstraße 13b",
  longitude: 16.302778,
  latitude: 48.182222,
  guide: user
)

# do not change
# 5
sight = Sight.create!(
  name: "Wiener Riesenrad",
  city: "Vienna",
  address: "Riesenradpl. 1",
  longitude: 16.395833,
  latitude: 48.216667,
  guide: user
)
# do not change
# 6
sight = Sight.create!(
  name: "Albertina",
  city: "Vienna",
  address: "Albertinapl. 1",
  longitude: 16.367778,
  latitude: 48.204444,
  guide: user
)
# do not change
# 7
sight = Sight.create!(
  name: "Kunsthistorisches Museum",
  city: "Vienna",
  address: "Maria-Theresien-Platz",
  longitude: 16.361667,
  latitude: 48.203611,
  guide: user
)
# do not change
# 8
sight = Sight.create!(
  name: "Donauturm",
  city: "Vienna",
  address: "Donauturmplatz 1",
  longitude: 16.410833,
  latitude: 48.24,
  guide: user
)
# do not change
# 9
sight = Sight.create!(
  name: "Naturhistorisches Museum",
  city: "Vienna",
  address: "Burgring 7",
  longitude: 16.359722,
  latitude: 48.205278,
  guide: user
)
# do not change
# 10
sight = Sight.create!(
  name: "Schatzkammer",
  city: "Vienna",
  address: "Hofburg, Schweizerhof",
  longitude: 16.365556,
  latitude: 48.206667,
  guide: user
)
# do not change
# 11
sight = Sight.create!(
  name: "Spanish Riding School",
  city: "Vienna",
  address: "Michaelerplatz 1",
  longitude: 16.366944,
  latitude: 48.206944,
  guide: user
)
# do not change
# 12
sight = Sight.create!(
  name: "Brandenburg Gate",
  city: "Berlin",
  address: "Pariser Platz, 10117 Berlin, Germany",
  longitude: 13.377775,
  latitude: 52.516266,
  guide: user
)


puts "Creating bookings"
Citytour.all.each do |tour|
  Booking.create!(
    start: DateTime.now + 1.days,
    end: DateTime.now + 1.days,
    quantity: 2,
    user: User.second,
    citytour: tour
  )
  Booking.all.each do |booking|
    5.times do
      Review.create!(
        rating: rand(0..10),
        reviewtext: Faker::Quote.most_interesting_man_in_the_world,
        booking: booking,
        isguide: Faker::Boolean.boolean(true_ratio: 0.5)
      )
    end
  end
end
puts "Finished creating bookings"

# puts "Creating reviews"
# Booking.all.each do |booking|
#   5.times do
#     Review.create!(
#       rating: rand(0..10),
#       reviewtext: Faker::Lorem.sentence(word_count: 20),
#       booking_id: booking,
#       isguide: Faker::Boolean.boolean(true_ratio: 0.5)
#     )
#   end
# end
# puts "Finished creating reviews"

user = User.create!(
  first_name: "Melchior-Christoph",
  last_name: "von Brincken",
  name:  "Melchior-Christoph von Brincken",
  nickname: "Melchior",
  email: "christoph.brincken@gmx.at",
  password: "123456",
  payment_details: "4711",
  country: "Austria",
  language_list: "English, german",
  guide:  true,
)
puts "Last User finished!"


puts "All finished!"
