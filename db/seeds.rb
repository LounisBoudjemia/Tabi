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
User.destroy_all
Activity.destroy_all
Stop.destroy_all
Trip.destroy_all

User.create!(email: "lounisboudjemia@gmail.com", password: "password")
User.create!(email: "florian@florian.com", password: "password")
User.create!(email: "frida@frida.com", password: "password")
User.create!(email: "navid@navid.com", password: "password")

# japan = Trip.create!(name: "Japan", start_date: "2023-09-05", end_date: "2023-09-30")
# france = Trip.create!(name: "France", start_date: "2024-09-14", end_date: "2024-10-09")

# hiro = Stop.create!(trip: japan, name: "Hiroshima", start_date: "2023-09-06", end_date: "2023-09-09", address: "3 Chome-1-1 Otemachi, Naka Ward, Hiroshima, 730-0051, Japan")

# paris = Stop.create!(trip: france, name: "Paris", start_date: "2024-09-14", end_date: "2024-09-20", address: "55, avenue des champs élysées Paris")

# salavre = Stop.create!(trip: rance, name: "Salavre", start_date: "2024-09-20", end_date: "2024-09-23",
#             address: "Salavre")

# jura = Stop.create!(trip: france, name: "Jura", start_date: "2024-09-23", end_date: "2024-09-27",
#             address: "Lons le Saunier, France")

# Activity.create!(stop: paris, name: "Day at Disneyland Paris",
#                 start_date:"2024-09-16", favorite: true, category: "amusement park",
#                 description: "Day trip at Disneyland Paris. Opens at 9.")

# Stop.create!(trip: japan, name: "Aso", start_date: "2023-09-09", end_date: "2023-09-12",
#              address: "1506 Otohime, Aso, Kumamoto 869-2226, Japon")


# Stop.create!(trip: japan, name: "Fukuoka", start_date: "2023-09-12", end_date: "2023-09-15",
#              address: "Fukuoka")

# Stop.create!(trip: japan, name: "Okinawa", start_date: "2023-09-15", end_date: "2023-09-21",
#              address: "938 Ishikawa, 本部町 Motobu, Kunigami District, Okinawa 905-0206, Japon")

# Stop.create!(trip: japan, name: "Nagoya", start_date: "2023-09-21", end_date: "2023-09-24",
#              address: "3 Chome-1-22 Nishiki, Naka Ward, Nagoya, Aichi 460-0003, Japon")

# Stop.create!(trip: japan, name: "Tokyo", start_date: "2023-09-24", end_date: "2023-09-30",
#              address: "Japon, 〒154-0001 Tokyo, Setagaya City, Ikejiri, 2 Chome−26−5 池尻網野レジデンス")

# Activity.create!(stop: hiro, name: "peace memorial museum",
#                  start_date:"2023-09-07", favorite: true, category:"museum",
#                  description: "Visit of the peace memorial museum. 200 yens.")

# Activity.create!(stop: hiro, name: "Miyajima",
#                 start_date:"2023-09-08", favorite: true, category: "outdoors",
#                 description: "Day trip to Miyajima Island. Train to Miyajimaguchi then ferry to the island.")
