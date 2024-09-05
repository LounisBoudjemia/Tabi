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
france = Trip.create!(name: "France", start_date: "2024-09-14", end_date: "2024-10-02")
usa = Trip.create!(name: "USA 2025", start_date: "2025-05-05", end_date: "2025-05-25")

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

paris = Stop.create!(trip: france, name: "Paris", start_date: "2024-09-14", end_date: "2024-09-19",
address: "Paris", description: "I'm so excited and I just can't hide it!")

dijon = Stop.create!(trip: france, name: "Dijon", start_date: "2024-09-19", end_date: "2024-09-21",
address: "dijon")

lyon = Stop.create!(trip: france, name: "Lyon", start_date: "2024-09-21", end_date: "2024-09-25",
address: "Lyon")

marseille = Stop.create!(trip: france, name: "Marseille", start_date: "2024-09-25", end_date: "2024-09-29",
address: "Marseille")

bordeaux = Stop.create!(trip: france, name: "Bordeaux", start_date: "2024-09-29", end_date: "2024-01-02",
address: "Bordeaux")


Activity.create!(stop: paris, name: "PSG Game!",
  start_date:"2024-09-14", favorite: true, category: "Art",
  description: "Game starts at 9PM. Plan enough time to get there and get in the stadium.",
  location: "Parc des Princes, Paris")

Activity.create!(stop: paris, name: "Eiffel Tower",
  start_date:"2024-09-15", favorite: true, category: "Views",
  description: "It's metal and not small and doesn't judge me at all.",
  location: "Eiffel Tower, Paris")


Activity.create!(stop: paris, name: "Musée d'Orsay",
  start_date:"2024-09-15", favorite: true, category: "Museum",
  description: "Impressionism impresses me!",
  location: "Musée d'Orsay, Paris")

Activity.create!(stop: paris, name: "Notre Dame",
    start_date:"2024-09-16", favorite: true, category: "Views",
    description: "She's mine, she's yours, she's Notre Dame.",
    location: "Notre-Dame de Paris, Paris")

Activity.create!(stop: paris, name: "Picnic in Jardin du Luxembourg",
      start_date:"2024-09-16", favorite: true, category: "Food",
      description: "We can nom nom nom there if the weather if nice",
      location: "Jardin du Luxembourg, Paris")

Activity.create!(stop: paris, name: "Stroll in the Latin Quarter",
  start_date:"2024-09-16", favorite: true, category: "Views",
  description: "Explore the neighborhood, checkout the Pantheon and the botanical garden.
  They speak French, not Latin.",
  location: "Latin Quarter, Paris")

Activity.create!(stop: paris, name: "Dinner at Bouillon Julien",
    start_date:"2024-09-16", favorite: true, category: "Food",
    description: "Traditional Bouillon restaurant with a Art Nouveau style.",
    location: "Bouillon Julien, Paris")

Activity.create!(stop: paris, name: "Visit the Louvre",
  start_date:"2024-09-17", favorite: true, category: "Art",
  description: "Go there early before it gets too busy.",
  location: "Musée du Louvre, Paris")

Activity.create!(stop: paris, name: "Check out the Champs Élysées",
    start_date:"2024-09-17", favorite: true, category: "Views",
    description: "They call it the world's most beautiful avenue. We'll see about that.",
    location: "Avenue des Champs Élysées, Paris")

Activity.create!(stop: paris, name: "Evening at the Opéra",
  start_date:"2024-09-17", favorite: true, category: "Art",
  description: "Get some of that culture in you, it'll do you good.",
  location: "Palais Garnier, Paris")


Activity.create!(stop: paris, name: "Visit Cergy-Pontoise",
    start_date:"2024-09-17", favorite: true, category: "Views",
    description: "Hahahahahahahahaha. This place sucks.",
    location: "Cergy, France")
