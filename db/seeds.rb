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

japan = Trip.create!(name: "Japan", start_date: "2023-09-05", end_date: "2023-09-30")

hiro = Stop.create!(trip: japan, name: "Hiroshima", start_date: "2023-09-06", end_date: "2023-09-09",
                    address: "3 Chome-1-1 Otemachi, Naka Ward, Hiroshima, 730-0051, Japon")

Stop.create!(trip: japan, name: "Aso", start_date: "2023-09-09", end_date: "2023-09-12",
             address: "1506 Otohime, Aso, Kumamoto 869-2226, Japon")

Stop.create!(trip: japan, name: "Fukuoka", start_date: "2023-09-12", end_date: "2023-09-15",
             address: "1 Chome-15-22 Daimyo, Chuo Ward, Fukuoka, 810-0041, Japon")

Stop.create!(trip: japan, name: "Okinawa", start_date: "2023-09-15", end_date: "2023-09-21",
             address: "938 Ishikawa, 本部町 Motobu, Kunigami District, Okinawa 905-0206, Japon")

Stop.create!(trip: japan, name: "Nagoya", start_date: "2023-09-21", end_date: "2023-09-24",
             address: "3 Chome-1-22 Nishiki, Naka Ward, Nagoya, Aichi 460-0003, Japon")

Stop.create!(trip: japan, name: "Tokyo", start_date: "2023-09-24", end_date: "2023-09-30",
             address: "Japon, 〒154-0001 Tokyo, Setagaya City, Ikejiri, 2 Chome−26−5 池尻網野レジデンス")

Activity.create!(stop: hiro, name: "peace memorial museum",
                 start_date:"2023-09-07", favorite: true, category:"museum",
                 description: "Visit of the peace memorial museum. 200 yens.")

Activity.create!(stop: hiro, name: "Miyajima",
                start_date:"2023-09-08", favorite: true, category: "museum",
                description: "Day trip to Miyajima Island. Train to Miyajimaguchi then ferry to the island.")
