# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"
require 'faker'

puts "Cleaning database"
# rails db:seed:replant
Sight.destroy_all
Citytour.destroy_all
User.destroy_all

puts "Creating"

# VERSUCH mit CLOUDINARY
# resource_type = "image"
#   type = "upload"
#   version = 1234567890
#   public_id = "wv7l1o6xwimtfvx2oxdw"
#   format = "jpg"
#   signature = Cloudinary::Utils.api_sign_request({:public_id=>public_id,
#   :version=>version}, Cloudinary.config.api_secret)
#   photo = "#{resource_type}/#{type}/v#{version}/#{public_id}.#{format}##{signature}"

#   sight = Sight.create!(
#     name: "Schönbrunn Palace",
#     city: "Vienna",
#     address: "Schönbrunner Schloßstraße 47, 1130 Wien",
#     longitude: 16.311865,
#     latitude: 48.184517,
#     guide: user,
#     photo: photo
#   )

# VERSUCH mit CLOUDINARY oder LOCAL
# sight = Sight.create!(

#   name: "Schönbrunn Palace",
#   city: "Vienna",
#   address: "Schönbrunner Schloßstraße 47, 1130 Wien",
#   longitude: 16.311865,
#   latitude: 48.184517,
#   guide: user,
  #photo Spanische Reitschule
 #  photo: https://res.cloudinary.com/dthgfvayv/image/upload/v1662748866/development/1024px-Spanish_Riding_School_Vienna_tzimra.jpg

 #photo Schoenbrunn
 # photo: File.open(Rails.root.join('public', 'images', 'schoenbrunn.jpg')


# photo.attach(params[:photo]) # ActionDispatch::Http::UploadedFile object
# photo.attach(params[:signed_blob_id]) # Signed reference to blob from direct upload
# photo.attach(io: File.open("/public/images/schoenbrunn.jpg"), filename: "schoenbrunn.jpg", content_type: "image/jpg")
# photo.attach(photo_blob) # ActiveStorage::Blob object

  # photo = MaterialTransferAgreement.new
  # mta.file.attach(io: File.open("#{Rails.root}/doc/xyz.pdf")), filename: "xyz.pdf", content_type: "application/pdf")
  # mta.save



# puts "xxx Creating PHOTO"



# puts "Creating PHOTO"



# puts "xxx Creating PHOTO"


# VERSUCH mit CLOUDINARY
# resource_type = "image"
#   type = "upload"
#   version = 1234567890
#   public_id = "wv7l1o6xwimtfvx2oxdw"
#   format = "jpg"
#   signature = Cloudinary::Utils.api_sign_request({:public_id=>public_id,
#   :version=>version}, Cloudinary.config.api_secret)
#   photo = "#{resource_type}/#{type}/v#{version}/#{public_id}.#{format}##{signature}"

#   sight = Sight.create!(
#     name: "Schönbrunn Palace",
#     city: "Vienna",
#     address: "Schönbrunner Schloßstraße 47, 1130 Wien",
#     longitude: 16.311865,
#     latitude: 48.184517,
#     guide: user,
#     photo: photo
#   )
#   puts "xxx Creating PHOTO"

# puts "Created PHOTO"

puts 'Creating user'
languages = %w(german english french spanish dutch portuguese chinese)

user = User.create!(
  first_name: "Zack",
  last_name: "Levy",
  name: "Zack Levy",
  nickname: "Z",
  email: "zacklevy@email.com",
  password: "zlevy210",
  payment_details: "12345678910111213 01/23 056",
  country: "Israel",
  language_list: "English, Hebrew, Spanish, Thai(kitchen)",
  guide:  true,
)

user = User.create!(
  first_name: "Melchior-Christoph",
  last_name: "von Brincken",
  name:  "Melchior-Christoph von Brincken",
  nickname: "Melchior",
  email: "christoph.brincken@gmx.at",
  password: "123456",
  payment_details: "123445",
  country: "Austria",
  language_list: "English, german",
  guide:  true,
)

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
        reviewtext: Faker::Lorem.sentence(word_count: 20),
        booking: booking,
        isguide: Faker::Boolean.boolean(true_ratio: 0.5)
      )
    end
  end
end
puts "Finished creating bookings"

puts "Creating reviews"
Booking.all.each do |booking|
  5.times do
    Review.create!(
      rating: rand(0..10),
      reviewtext: Faker::Lorem.sentence(word_count: 20),
      booking_id: booking,
      isguide: Faker::Boolean.boolean(true_ratio: 0.5)
    )
  end
end
puts "Finished creating reviews"

  # puts "User finished!"

  sight = Sight.create!(
    name: "Dead Sea",
    city: "Ein Bokek",
    address: "Ein Bokek, Israel",
    longitude: 31.2002,
    latitude: 35.3625,
    guide: user
  )

puts "Sight finished!"

  citytour = Citytour.create!(
    name: "Masada/Dead Sea Tour",
    overview: "Visit Masada and the Dead Sea in one day, tours leaving from Jerusalem and Tel Aviv.",
    price: rand(0..400),
    guide: user
  )
puts "Citytour finished!"

  # puts "All finished!"

# puts 'Creating User'

# puts "All finished!"
