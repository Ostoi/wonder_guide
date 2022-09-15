# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'json'
require 'open-uri'
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
# languages = %w(german english french spanish dutch portuguese chinese)

guide = User.create!(
  name: "Zack Levy",
  email: "zacklevy@email.com",
  password: "zlevy210",
  # encrypted_password: "zlevy210",

  # language_list: "English, Hebrew, Spanish, Thai(kitchen)",
  guide: true
)
file = URI.open('https://res.cloudinary.com/dvneczoyg/image/upload/v1663064629/profile_for_today_ebgv4r.jpg')
guide.photo.attach(io: file, filename: 'guide.jpg', content_type: 'image/jpg')
guide.save!

traveller = User.create!(
  name: "Oliver Stoislow",
  email: "ostoi@email.com",
  password: "oliver",
  # language_list: "English, German(idk what else",
  guide: false
)
file = URI.open('https://res.cloudinary.com/dvneczoyg/image/upload/v1663064961/T02NE0241-U03Q0PFQ8QH-1c5b258e121b-192_thtjkf.jpg')
traveller.photo.attach(io: file, filename: 'traveller.jpg', content_type: 'image/jpg')
traveller.save!

# puts "User finished!"

# puts "Sight finished!"


citytour = Citytour.create!(
  name: "Masada/Dead Sea Tour",
  overview: "Visit Masada and the Dead Sea in one day, tours leaving from Jerusalem and Tel Aviv.",
  price: rand(50..400),
  guide: guide
)

Booking.create!(
  start: DateTime.now + 1.days,
  end: DateTime.now + 1.days,
  user: traveller,
  citytour: citytour
)
citytour = Citytour.create!(
  name: "Vienna Highlights",
  overview: "Take a tour through the amazing city of Vienna.",
  price: rand(50..400),
  guide: guide
)
citytour = Citytour.create!(
  name: "Berlin Tour",
  overview: "This might become your favourite tour when visiting Europe",
  price: rand(50..400),
  guide: guide
)
citytour = Citytour.create!(
  name: "Tel Aviv Tour",
  overview: "Stunning citysights await you in this wonderful experience",
  price: rand(50..400),
  guide: guide
)

# create a hash with sights (not sight object)
sights = {
  "0": {
    name: 'Schönbrunn Palace',
    city: 'Vienna',
    address: "Schönbrunner Schloßstraße 47",
    longitude: 16.311865,
    latitude: 48.184517,
    guide: guide,
    photo: "https://res.cloudinary.com/dthgfvayv/image/upload/v1662805199/development/wien_schoenbrunn_absfs0.jpg"
  },
  "1": {
    name: "Hofburg Palace",
    city: "Vienna",
    address: "Heldenplatz",
    longitude: 16.364763,
    latitude: 48.205532,
    guide: guide,
    photo: "https://res.cloudinary.com/dvneczoyg/image/upload/v1662991511/wien_hofburg_touioa_jhs1bk.jpg"
  },
  "2": {
    name: "Tiergarten Schönbrunn",
    city: "Vienna",
    address: "Maxingstraße 13b",
    longitude: 16.302778,
    latitude: 48.182222,
    guide: guide,
    photo: "https://res.cloudinary.com/dvneczoyg/image/upload/v1662991662/wien_tiergarten_sblgx9_libxxq.jpg"
  },
  "3": {
    name: "Wiener Riesenrad",
    city: "Vienna",
    address: "Riesenradpl. 1",
    longitude: 16.395833,
    latitude: 48.216667,
    guide: guide,
    photo: "https://res.cloudinary.com/dvneczoyg/image/upload/v1662991662/wien_tiergarten_sblgx9_libxxq.jpg"
  },
  "4": {
    name: "Albertina",
    city: "Vienna",
    address: "Albertinapl. 1",
    longitude: 16.367778,
    latitude: 48.204444,
    guide: guide,
    photo: "https://res.cloudinary.com/dvneczoyg/image/upload/v1662992285/wien_albertina_s0ywu0_q3kcb2.jpg"
  },
  "5": {
    name: "Kunsthistorisches Museum",
    city: "Vienna",
    address: "Maria-Theresien-Platz",
    longitude: 16.361667,
    latitude: 48.203611,
    guide: guide,
    photo: "https://res.cloudinary.com/dvneczoyg/image/upload/v1662993059/wien_donauturm_dcy4nv_qzyrql.jpg"
  },
  "6": {
    name: "Donauturm",
    city: "Vienna",
    address: "Donauturmplatz 1",
    longitude: 16.410833,
    latitude: 48.24,
    guide: guide,
    photo: "https://res.cloudinary.com/dvneczoyg/image/upload/v1662993059/wien_donauturm_dcy4nv_qzyrql.jpg"
  },
  "7": {
    name: "Naturhistorisches Museum",
    city: "Vienna",
    address: "Burgring 7",
    longitude: 16.359722,
    latitude: 48.205278,
    guide: guide,
    photo: "https://res.cloudinary.com/dthgfvayv/image/upload/v1662805197/development/wien_naturhistorisches_museum_cbhuop.jpg"
  },
  "8": {
    name: "Schatzkammer",
    city: "Vienna",
    address: "Hofburg, Schweizerhof",
    longitude: 16.365556,
    latitude: 48.206667,
    guide: guide,
    photo: "https://res.cloudinary.com/dvneczoyg/image/upload/v1662993377/Wien_schatzkammer_fqsohl_tpk9at.jpg"
  },
  "9": {
    name: "Spanish Riding School",
    city: "Vienna",
    address: "Michaelerplatz 1",
    longitude: 16.366944,
    latitude: 48.206944,
    guide: guide,
    photo: "https://res.cloudinary.com/dthgfvayv/image/upload/v1662805198/development/wien_spanish_riding_school_gtvmjx.jpg"
  },
  "10": {
    name: "Brandenburg Gate",
    city: "Berlin",
    address: "Pariser Platz, 10117 Berlin, Germany",
    longitude: 13.377775,
    latitude: 52.516266,
    guide: guide,
    photo: "https://res.cloudinary.com/dvneczoyg/image/upload/v1662994030/brandenburg_g_uk6udg.webp"
  },
  "11": {
    name: "Dead Sea",
    city: "Ein Bokek",
    address: "Ein Bokek, Israel",
    longitude: 31.2002,
    latitude: 35.3625,
    guide: guide,
    photo: "https://res.cloudinary.com/dvneczoyg/image/upload/v1662998480/deadsea_xd5wpy.jpg"
  }
}

Citytour.all.each do |ct|
  sights.values.sample(rand(4..6)).each do |sight_hash|
    created_sight = Sight.create!(sight_hash.except(:photo))

    file = URI.open(sight_hash[:photo])
    formatted_file_name = "#{sight_hash[:name].downcase.gsub(" ", "_")}.jpg"
    created_sight.photo.attach(io: file, filename: formatted_file_name, content_type: 'image/jpg')
    created_sight.save!

    CitytourSight.create!(
      citytour: ct,
      sight: created_sight
    )
  end
end

Sight.where.not(id: Sight.group(:name).select("min(id)")).destroy_all # destroys duplicates

# 5.times do |index|
#   sightsexample = Sight.create!(
#     name: sights[:"#{index}"][:name], # [:"0"]
#     city: sights[:"#{index}"][:city],
#     address: sights[:"#{index}"][:address],
#     longitude: sights[:"#{index}"][:longitude],
#     latitude: sights[:"#{index}"][:latitude],
#     guide: sights[:"#{index}"][:guide]
#   )


# end

# Booking.create!(
#   citytour: citytour,
#   user: traveller
# )
# puts "Citytour finished!"
# puts "All finished!"

# puts 'Creating 10 Sights'
# user = User.create!(
#   name: Faker::Name.name,
#   email: Faker::Internet.email,
#   password: "secret",
#   guide: Faker::Boolean.boolean(true_ratio: 0.5)
# )
# schonbrunn_p = Sight.new(
#   name: 'Schönbrunn Palace',
#   city: 'Vienna',
#   address: "Schönbrunner Schloßstraße 47",
#   longitude: 16.311865,
#   latitude: 48.184517,
#   guide: guide
# )
# file = URI.open('https://res.cloudinary.com/dthgfvayv/image/upload/v1662805199/development/wien_schoenbrunn_absfs0.jpg')
# schonbrunn_p.photo.attach(io: file, filename: 'schonbrunn-p.jpg', content_type: 'image/jpg')
# schonbrunn_p.save!
# puts 'Created Sight'

# puts "All finished!"


# hofburg_p = Sight.new(
#   name: "Hofburg Palace",
#   city: "Vienna",
#   address: "Heldenplatz",
#   longitude: 16.364763,
#   latitude: 48.205532,
#   guide: guide
# )
# file = URI.open('https://res.cloudinary.com/dvneczoyg/image/upload/v1662991511/wien_hofburg_touioa_jhs1bk.jpg')
# hofburg_p.photo.attach(io: file, filename: 'hofburg_p.jpg', content_type: 'image/jpg')
# hofburg_p.save!

# tier_schon = Sight.new(
#   name: "Tiergarten Schönbrunn",
#   city: "Vienna",
#   address: "Maxingstraße 13b",
#   longitude: 16.302778,
#   latitude: 48.182222,
#   guide: guide
# )
# file = URI.open('https://res.cloudinary.com/dvneczoyg/image/upload/v1662991662/wien_tiergarten_sblgx9_libxxq.jpg')
# tier_schon.photo.attach(io: file, filename: 'tier_schon.jpg', content_type: 'image/jpg')
# tier_schon.save!

# # do not change
# # 5
# wiener_res = Sight.new(
#   name: "Wiener Riesenrad",
#   city: "Vienna",
#   address: "Riesenradpl. 1",
#   longitude: 16.395833,
#   latitude: 48.216667,
#   guide: guide
# )
# file = URI.open('https://res.cloudinary.com/dvneczoyg/image/upload/v1662991662/wien_tiergarten_sblgx9_libxxq.jpg')
# wiener_res.photo.attach(io: file, filename: 'wiener_res.jpg', content_type: 'image/jpg')
# wiener_res.save!

# # do not change
# # 6
# albertina = Sight.new(
#   name: "Albertina",
#   city: "Vienna",
#   address: "Albertinapl. 1",
#   longitude: 16.367778,
#   latitude: 48.204444,
#   guide: guide
# )
# file = URI.open('https://res.cloudinary.com/dvneczoyg/image/upload/v1662992285/wien_albertina_s0ywu0_q3kcb2.jpg')
# albertina.photo.attach(io: file, filename: 'albertina.jpg', content_type: 'image/jpg')
# albertina.save!
# # do not change
# # 7
# kunsthistorisches_m = Sight.new(
#   name: "Kunsthistorisches Museum",
#   city: "Vienna",
#   address: "Maria-Theresien-Platz",
#   longitude: 16.361667,
#   latitude: 48.203611,
#   guide: guide
# )
# file = URI.open('https://res.cloudinary.com/dvneczoyg/image/upload/v1662993059/wien_donauturm_dcy4nv_qzyrql.jpg')
# kunsthistorisches_m.photo.attach(io: file, filename: 'kunsthistorisches_m.jpg', content_type: 'image/jpg')
# kunsthistorisches_m.save!
# # do not change
# # 8
# donauturm = Sight.new(
#   name: "Donauturm",
#   city: "Vienna",
#   address: "Donauturmplatz 1",
#   longitude: 16.410833,
#   latitude: 48.24,
#   guide: guide
# )
# file = URI.open('https://res.cloudinary.com/dvneczoyg/image/upload/v1662993059/wien_donauturm_dcy4nv_qzyrql.jpg')
# donauturm.photo.attach(io: file, filename: 'donauturm.jpg', content_type: 'image/jpg')
# donauturm.save!
# # do not change
# # 9
# naturhistorisches = Sight.new(
#   name: "Naturhistorisches Museum",
#   city: "Vienna",
#   address: "Burgring 7",
#   longitude: 16.359722,
#   latitude: 48.205278,
#   guide: guide
# )
# file = URI.open('https://res.cloudinary.com/dthgfvayv/image/upload/v1662805197/development/wien_naturhistorisches_museum_cbhuop.jpg')
# naturhistorisches.photo.attach(io: file, filename: 'naturhistorisches.jpg', content_type: 'image/jpg')
# naturhistorisches.save!
# # do not change
# # 10
# schatzkammer = Sight.new(
#   name: "Schatzkammer",
#   city: "Vienna",
#   address: "Hofburg, Schweizerhof",
#   longitude: 16.365556,
#   latitude: 48.206667,
#   guide: guide
# )
# file = URI.open('https://res.cloudinary.com/dvneczoyg/image/upload/v1662993377/Wien_schatzkammer_fqsohl_tpk9at.jpg')
# schatzkammer.photo.attach(io: file, filename: 'schatzkammer.jpg', content_type: 'image/jpg')
# schatzkammer.save!
# # do not change
# # 11
# riding_school = Sight.new(
#   name: "Spanish Riding School",
#   city: "Vienna",
#   address: "Michaelerplatz 1",
#   longitude: 16.366944,
#   latitude: 48.206944,
#   guide: guide
# )
# file = URI.open('https://res.cloudinary.com/dthgfvayv/image/upload/v1662805198/development/wien_spanish_riding_school_gtvmjx.jpg')
# riding_school.photo.attach(io: file, filename: 'riding_school.jpg', content_type: 'image/jpg')
# riding_school.save!
# # do not change
# # 12
# brandenburg_g = Sight.new(
#   name: "Brandenburg Gate",
#   city: "Berlin",
#   address: "Pariser Platz, 10117 Berlin, Germany",
#   longitude: 13.377775,
#   latitude: 52.516266,
#   guide: guide
# )
# file = URI.open('https://res.cloudinary.com/dvneczoyg/image/upload/v1662994030/brandenburg_g_uk6udg.webp')
# brandenburg_g.photo.attach(io: file, filename: 'brandenburg_g.jpg', content_type: 'image/jpg')
# brandenburg_g.save!

# deadsea = Sight.new(
#   name: "Dead Sea",
#   city: "Ein Bokek",
#   address: "Ein Bokek, Israel",
#   longitude: 31.2002,
#   latitude: 35.3625,
#   guide: guide
# )
# file = URI.open('https://res.cloudinary.com/dvneczoyg/image/upload/v1662998480/deadsea_xd5wpy.jpg')
# deadsea.photo.attach(io: file, filename: 'dead_sea.jpg', content_type: 'image/jpg')
# deadsea.save!

puts "Creating bookings"
Citytour.all.each do |tour|
  Booking.create!(
    start: DateTime.now + 1.days,
    end: DateTime.now + 1.days,
    user: traveller,
    citytour: tour,
    status: "pending"
  )
  Booking.all.each do |booking|
    5.times do
      Review.create!(
        rating: rand(0..10),
        reviewtext: Faker::Quote.most_interesting_man_in_the_world,
        booking: booking
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
  name: "Melchior-Christoph von Brincken",
  email: "christoph.brincken@gmx.at",
  password: "123456",
  # language_list: "English, german",
  guide: true,
)
puts "Last User finished!"
puts "All finished!"
