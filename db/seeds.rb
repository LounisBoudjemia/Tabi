# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Cleaning database..."

# DESTROY ALL
Activity.destroy_all
Stop.destroy_all
ChecklistItem.destroy_all
Item.destroy_all
Checklist.destroy_all
ChecklistTemplate.destroy_all
Trip.destroy_all
User.destroy_all

# CREATE USERS
User.create!(email: "lounis@lounis.com", password: "password")
puts "Users created!"

# CREATE TRIPS
japan = Trip.create!(name: "Japan", start_date: "2023-09-05", end_date: "2023-09-30")
italy = Trip.create!(name: "Italy", start_date: "2019-05-11", end_date: "2019-05-25")
vietnam = Trip.create!(name: "Vietnam", start_date: "2022-06-24", end_date: "2022-07-06")
france = Trip.create!(name: "France", start_date: "2024-12-21", end_date: "2025-01-05")

puts "Trips created!"

# JAPAN STOPS
hiro = Stop.create!(trip: japan, name: "Hiroshima", start_date: "2023-09-06", end_date: "2023-09-09",
                      address: "3 Chome-1-1 Otemachi, Naka Ward, Hiroshima, 730-0051, Japan")

aso = Stop.create!(trip: japan, name: "Aso", start_date: "2023-09-09", end_date: "2023-09-12",
                    address: "Aso")

fukuoka = Stop.create!(trip: japan, name: "Fukuoka", start_date: "2023-09-12", end_date: "2023-09-15",
                        address: "Fukuoka")

okinawa = Stop.create!(trip: japan, name: "Okinawa", start_date: "2023-09-15", end_date: "2023-09-21",
                        address: "Motobu")

nagoya = Stop.create!(trip: japan, name: "Nagoya", start_date: "2023-09-21", end_date: "2023-09-24",
                        address: "Nagoya")

tokyo = Stop.create!(trip: japan, name: "Tokyo", start_date: "2023-09-24", end_date: "2023-09-30",
                      address: "Tokyo")


Activity.create!(stop: hiro, name: "peace memorial museum",
              start_date:"2023-09-07", favorite: true, category: "museum",
              description: "Visit of the peace memorial park and museum.",
              location: "Peace memorial park, Hiroshima")

Activity.create!(stop: hiro, name: "Toyo Carps baseball game",
  start_date:"2023-09-07", favorite: true, category: "Views",
  description: "Home run and baseball fun. Game starts at 6PM. Be there a bit early to pick up the tickets.",
  location: "MAZDA Zoom-Zoom Hiroshima Stadium")

Activity.create!(stop: hiro, name: "Miyajima",
                start_date:"2023-09-08", favorite: true, category: "Nature",
                description: "Day trip to Miyajima Island. Train to Miyajimaguchi then ferry to the island.",
                location: "Itsukushima-jinja")

Activity.create!(stop: nagoya, name: "Ghibli",
  start_date:"2023-09-22", favorite: true, category: "Art",
  description: "Day at Ghibli Park",
  location: "Ghibli Park")
