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
Trip.destroy_all
Stop.destroy_all

japan = Trip.create!(name: "Japan", start_date: "2023-09-05", end_date: "2023-09-30")

Stop.create!(trip = japan, name: "Hiroshima", start_date: "2023-09-06", end_date: "2023-09-09",
            address: "Hiroshima", latitude: 34.38953357735992, longitude: 132.4553596419604)

  Stop.create!(trip = japan, name: "Hiroshima", start_date: "2023-09-06", end_date: "2023-09-09",
              address: "Hiroshima", longitude: 132.449997, latitude: 34.383331)
