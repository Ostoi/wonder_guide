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
  name: "Melchior-Christoph von Brincken",
  email: "christoph.brincken@gmx.at",
  password: "123456",
  guide: true,
)

traveller = User.create!(
  name: "Sydel Chayat",
  email: "Sydel@email.com",
  password: "123456",
  guide: false
)
file = URI.open('https://res.cloudinary.com/dthgfvayv/image/upload/v1663238928/gzohgypaeva1akptii2g.jpg')
traveller.photo.attach(io: file, filename: 'traveller.jpg', content_type: 'image/jpg')
traveller.save!

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

puts "User finished!"

# puts "Sight finished!"

citytour = Citytour.create!(
  name: "Dead Sea Tour",
  overview: "Visit the Dead Sea and other amazing locations around the country, tours leaving from Jerusalem and Tel Aviv.",
  price: rand(50..400),
  guide: guide,
  country: "israel"
)

Booking.create!(
  start: DateTime.now + rand(1..7).days,
  end: DateTime.now + rand(8..21).days,
  user: traveller,
  citytour: citytour
)

citytour = Citytour.create!(
  name: "Vienna Highlights",
  overview: "Take a tour through the amazing city of Vienna.",
  price: rand(50..400),
  guide: guide,
  country: "austria"
)
citytour = Citytour.create!(
  name: "The best of Berlin",
  overview: "This might become your favourite tour when visiting Europe.",
  price: rand(50..400),
  guide: guide,
  country: "germany"
)
citytour = Citytour.create!(
  name: "Roundtrip Philippines",
  overview: "Walk on white beaches and enjoy the best places of the Philippines.",
  price: rand(50..400),
  guide: guide,
  country: "philippines"
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
    photo: "https://res.cloudinary.com/dthgfvayv/image/upload/v1663227936/hwy8feuma5xfanu1mdmj.jpg"
  },
  "1": {
    name: "Hofburg Palace",
    city: "Vienna",
    address: "Heldenplatz",
    longitude: 16.364763,
    latitude: 48.205532,
    guide: guide,
    photo: "https://res.cloudinary.com/dthgfvayv/image/upload/v1663227772/uood5n6ouhg8qxgzting.jpg"
  },
  "2": {
    name: "Tiergarten Schönbrunn",
    city: "Vienna",
    address: "Maxingstraße 13b",
    longitude: 16.302778,
    latitude: 48.182222,
    guide: guide,
    photo: "https://res.cloudinary.com/dthgfvayv/image/upload/v1663227985/jhvwo6cmisxwkc439elw.jpg"
  },
  "3": {
    name: "Wiener Riesenrad",
    city: "Vienna",
    address: "Riesenradpl. 1",
    longitude: 16.395833,
    latitude: 48.216667,
    guide: guide,
    photo: "https://res.cloudinary.com/dthgfvayv/image/upload/v1663227995/rnz8izmrwujzizj8lqi1.jpg"
  },
  "4": {
    name: "Albertina",
    city: "Vienna",
    address: "Albertinapl. 1",
    longitude: 16.367778,
    latitude: 48.204444,
    guide: guide,
    photo: "https://res.cloudinary.com/dthgfvayv/image/upload/v1663227652/apnqpvmnqxbbl5w57o4h.jpg"
  },
  "5": {
    name: "Kunsthistorisches Museum",
    city: "Vienna",
    address: "Maria-Theresien-Platz",
    longitude: 16.361667,
    latitude: 48.203611,
    guide: guide,
    photo: "https://res.cloudinary.com/dthgfvayv/image/upload/v1663227790/yowodqwyz1vxvuajqmk0.jpg"
  },
  # "6": {
  #   name: "Donauturm",
  #   city: "Vienna",
  #   address: "Donauturmplatz 1",
  #   longitude: 16.410833,
  #   latitude: 48.24,
  #   guide: guide,
  #   photo: "https://res.cloudinary.com/dthgfvayv/image/upload/v1663227764/zw2azjrslpinzvtwcb0f.jpg"
  # },
  "6": {
    name: "Naturhistorisches Museum",
    city: "Vienna",
    address: "Burgring 7",
    longitude: 16.359722,
    latitude: 48.205278,
    guide: guide,
    photo: "https://res.cloudinary.com/dthgfvayv/image/upload/v1663227905/ds0mcwo1m8kbt5stpnfn.jpg"
  },
  "7": {
    name: "Schatzkammer",
    city: "Vienna",
    address: "Hofburg, Schweizerhof",
    longitude: 16.365556,
    latitude: 48.206667,
    guide: guide,
    photo: "https://res.cloudinary.com/dthgfvayv/image/upload/v1663227919/g60cglml9vinz44fsqcv.jpg"
  },
  "8": {
    name: "Spanish Riding School",
    city: "Vienna",
    address: "Michaelerplatz 1",
    longitude: 16.366944,
    latitude: 48.206944,
    guide: guide,
    photo: "https://res.cloudinary.com/dthgfvayv/image/upload/v1663227970/vpmvaqe6zaf6k4cdvenn.jpg"
  },
  "9": {
    name: "Brandenburg Gate",
    city: "Berlin",
    address: "Pariser Platz",
    longitude: 13.377775,
    latitude: 52.516266,
    guide: guide,
    photo: "https://res.cloudinary.com/dthgfvayv/image/upload/v1663227739/l2dtnacorsopsf1yqezn.jpg"
  },
  "10": {
    name: "Gendarmenmarkt",
    city: "Berlin",
    address: "Gendarmenmarkt",
    longitude: 13.392350,
    latitude: 52.513828,
    guide: guide,
    photo: "https://res.cloudinary.com/dthgfvayv/image/upload/v1663253916/ytww9errocdwe5kgwo3h.jpg"
  },
  "11": {
    name: "Pergamonmuseum",
    city: "Berlin",
    address: "Bodestraße 1-3",
    longitude: 13.396900,
    latitude: 52.521183,
    guide: guide,
    photo: "https://res.cloudinary.com/dthgfvayv/image/upload/v1663253917/yquqxpx6yvg2d5lpz0fa.jpg"
  },
  "12": {
    name: "Boracay",
    city: "Barangay Yapak",
    address: "Boracay Island",
    longitude: 121.924759,
    latitude: 11.96735,
    guide: guide,
    photo: "https://res.cloudinary.com/dthgfvayv/image/upload/v1663253919/m5pdquvrwr4qd4favozo.jpg"
  },
  # "13": {
  #   name: "Coron",
  #   city: "Barangay Yapak",
  #   address: "Palawan Island",
  #   longitude: 120.239734,
  #   latitude: 11.928329,
  #   guide: guide,
  #   photo: "https://res.cloudinary.com/dthgfvayv/image/upload/v1663253920/rzneel2valriyz8xxyzr.jpg"
  # },
  "13": {
    name: "Bon Bon Beach",
    city: "Barangay Yapak",
    address: "Romblon City",
    longitude: 122.244614,
    latitude: 12.572541,
    guide: guide,
    photo: "https://res.cloudinary.com/dthgfvayv/image/upload/v1663253922/r8zhenqyhvqrjnhp3844.jpg"
  },
  # "16": {
  #   name: "Puerto Princesa",
  #   city: "Barangay Yapak",
  #   address: "Puerto Princesa City",
  #   longitude: 118.78551,
  #   latitude: 9.967216,
  #   guide: guide,
  #   photo: "https://res.cloudinary.com/dthgfvayv/image/upload/v1663253923/sldewj2mwhllxdgk1lpk.jpg"
  # },
  # "15": {
  #   name: "Alegria Beach",
  #   city: "Barangay Yapak",
  #   address: "Santa Monica",
  #   longitude: 126.071046,
  #   latitude: 10.054659,
  #   guide: guide,
  #   photo: "https://res.cloudinary.com/dthgfvayv/image/upload/v1663253924/ousevfwzgpdxahc13mlc.jpg"
  # },
  "14": {
    name: "Subic Beach",
    city: "Barangay Yapak",
    address: "Subic, Zambales",
    longitude: 120.23662969999998,
    latitude: 14.8967937,
    guide: guide,
    photo: "https://res.cloudinary.com/dthgfvayv/image/upload/v1663253926/iiavk3inxjabwxewf9rg.jpg"
  },
  "15": {
    name: "Dead Sea",
    city: "Rosh Hanikra",
    address: "Ein Bokek",
    longitude: 31.2002,
    latitude: 35.3625,
    guide: guide,
    photo: "https://res.cloudinary.com/dthgfvayv/image/upload/v1663227754/pbyavqe8n5lcvlb4bvt3.jpg"
  },
  "16": {
    name: "Mitspeh Ramon",
    city: "Rosh Hanikra",
    address: "Makhtesh Ramon Visitors Center",
    longitude: 34.801834,
    latitude: 30.610594,
    guide: guide,
    photo: "https://res.cloudinary.com/dthgfvayv/image/upload/v1663256591/aetycvfcguaerppv5lqs.jpg"
  },
  "17": {
    name: "Rosh Hanikra",
    city: "Rosh Hanikra",
    address: "Rosh Hanikra Grottoes",
    longitude: 33.0861,
    latitude: 35.1135,
    guide: guide,
    photo: "https://res.cloudinary.com/dthgfvayv/image/upload/v1663256592/s8z1mb00ypnuakr2lkzt.jpg"
  }
}

puts "Creating sights"
sights.values.each do |sight_hash|
  created_sight = Sight.create!(sight_hash.except(:photo))
  file = URI.open(sight_hash[:photo])
  formatted_file_name = "#{sight_hash[:name].downcase.gsub(" ", "_")}.jpg"
  created_sight.photo.attach(io: file, filename: formatted_file_name, content_type: 'image/jpg')
  created_sight.save!
end
puts "Finished creating sights"

cities = Sight.distinct.pluck(:city)
cities.each do |city_name|
  puts "Creating CitytourSights for #{city_name}"
  geocoded_result = Geocoder.search(city_name)
  country = geocoded_result.first.country.downcase
  cts = Citytour.where(country: country)
  cts.each do |ct|
    sights_in_city = Sight.near(city_name, 500)
    sights_in_city.each do |sight|
      CitytourSight.create!(
        citytour: ct,
        sight: sight
      )
  end
  end
  puts "Finished creating CitytourSights for #{city_name}"
end


# Citytour.all.each do |ct|
#   sights.values.sample(rand(4..6)).each do |sight_hash|
#     created_sight = Sight.create!(sight_hash.except(:photo))

#     file = URI.open(sight_hash[:photo])
#     formatted_file_name = "#{sight_hash[:name].downcase.gsub(" ", "_")}.jpg"
#     created_sight.photo.attach(io: file, filename: formatted_file_name, content_type: 'image/jpg')
#     created_sight.save!

#     CitytourSight.create!(
#       citytour: ct,
#       sight: created_sight
#     )
#   end
# end


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
    start: DateTime.now + rand(1..7).days,
    end: DateTime.now + rand(8..21).days,
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
puts "All finished!"
