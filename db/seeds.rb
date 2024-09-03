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
Item.destroy_all
ChecklistItem.destroy_all
Checklist.destroy_all
ChecklistTemplate.destroy_all
Trip.destroy_all
User.destroy_all

# CREATE USERS
lounis = User.create!(email: "lounisboudjemia@gmail.com", password: "password")
florian = User.create!(email: "florian@florian.com", password: "password")
frida = User.create!(email: "frida@frida.com", password: "password")
navid = User.create!(email: "navid@navid.com", password: "password")

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

Stop.create!(trip: japan, name: "Tokyo", start_date: "2023-09-24", end_date: "2023-09-30",
address: "Tokyo")
Stop.create!(trip: japan, name: "Tokyo", start_date: "2023-09-24", end_date: "2023-09-30",
address: "Tokyo")
Stop.create!(trip: japan, name: "Tokyo", start_date: "2023-09-24", end_date: "2023-09-30",
address: "Tokyo")
Stop.create!(trip: japan, name: "Tokyo", start_date: "2023-09-24", end_date: "2023-09-30",
address: "Tokyo")
Stop.create!(trip: japan, name: "Tokyo", start_date: "2023-09-24", end_date: "2023-09-30",
address: "Tokyo")
Stop.create!(trip: japan, name: "Tokyo", start_date: "2023-09-24", end_date: "2023-09-30",
address: "Tokyo")
Stop.create!(trip: japan, name: "Tokyo", start_date: "2023-09-24", end_date: "2023-09-30",
  address: "Tokyo")
  Stop.create!(trip: japan, name: "Tokyo", start_date: "2023-09-24", end_date: "2023-09-30",
  address: "Tokyo")
  Stop.create!(trip: japan, name: "Tokyo", start_date: "2023-09-24", end_date: "2023-09-30",
  address: "Tokyo")
  Stop.create!(trip: japan, name: "Tokyo", start_date: "2023-09-24", end_date: "2023-09-30",
  address: "Tokyo")
  Stop.create!(trip: japan, name: "Tokyo", start_date: "2023-09-24", end_date: "2023-09-30",
  address: "Tokyo")
  Stop.create!(trip: japan, name: "Tokyo", start_date: "2023-09-24", end_date: "2023-09-30",
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

puts "Activities created!"

# CHECKLISTS
japan_checklist = Checklist.create!(trip: japan, name: "Japan checklist")
vietnam_checklist = Checklist.create!(trip: vietnam, name: "Vietnam checklist")
italy_checklist = Checklist.create!(trip: italy, name: "Italy checklist")
france_checklist = Checklist.create!(trip: france, name: "France checklist")

puts "Checklists created!"

# CHECKLIST TEMPLATES LOUNIS
city_list_lounis = ChecklistTemplate.create!(user: lounis, name: "City trip checklist")
beach_list_lounis = ChecklistTemplate.create!(user: lounis, name: "Beach trip checklist")
backpacking_list_lounis = ChecklistTemplate.create!(user: lounis, name: "Backpacking checklist")

# CHECKLIST TEMPLATES FLORIAN
city_list_florian = ChecklistTemplate.create!(user: florian, name: "City trip checklist")
beach_list_florian = ChecklistTemplate.create!(user: florian, name: "Beach trip checklist")
backpacking_list_florian = ChecklistTemplate.create!(user: florian, name: "Backpacking checklist")

# CHECKLIST TEMPLATES FRIDA
city_list_frida = ChecklistTemplate.create!(user: frida, name: "City trip checklist")
beach_list_frida = ChecklistTemplate.create!(user: frida, name: "Beach trip checklist")
backpacking_list_frida = ChecklistTemplate.create!(user: frida, name: "Backpacking checklist")

# CHECKLIST TEMPLATES NAVID
city_list_navid = ChecklistTemplate.create!(user: navid, name: "City trip checklist")
beach_list_navid = ChecklistTemplate.create!(user: navid, name: "Beach trip checklist")
backpacking_list_navid = ChecklistTemplate.create!(user: navid, name: "Backpacking checklist")

puts "Checklist templates created!"

# ITEMS
passport = Item.create!(name: "Passport")
flight_tickets = Item.create!(name: "Flight tickets")
hotel_reservation = Item.create!(name: "Hotel reservation")
travel_insurance = Item.create!(name: "Travel insurance")
credit_card = Item.create!(name: "Credit card")
cash = Item.create!(name: "Cash")
phone_charger = Item.create!(name: "Phone charger")
camera = Item.create!(name: "Camera")
toothbrush = Item.create!(name: "Toothbrush")
toothpaste = Item.create!(name: "Toothpaste")
shampoo = Item.create!(name: "Shampoo")
conditioner = Item.create!(name: "Conditioner")
body_wash = Item.create!(name: "Body wash")
sunscreen = Item.create!(name: "Sunscreen")
sunglasses = Item.create!(name: "Sunglasses")
hat = Item.create!(name: "Hat")
flip_flops = Item.create!(name: "Flip flops")
swimsuit = Item.create!(name: "Swimsuit")
beach_towel = Item.create!(name: "Beach towel")
book = Item.create!(name: "Book")
headphones = Item.create!(name: "Headphones")
medication = Item.create!(name: "Medication")
first_aid_kit = Item.create!(name: "First aid kit")
umbrella = Item.create!(name: "Umbrella")
raincoat = Item.create!(name: "Raincoat")
jacket = Item.create!(name: "Jacket")
sweater = Item.create!(name: "Sweater")
scarf = Item.create!(name: "Scarf")
gloves = Item.create!(name: "Gloves")
hat = Item.create!(name: "Hat")
hiking_boots = Item.create!(name: "Hiking boots")
backpack = Item.create!(name: "Backpack")
sleeping_bag = Item.create!(name: "Sleeping bag")

puts "Items created!"

# CHECKLIST ITEMS
# JAPAN CHECKLIST ITEMS
ChecklistItem.create!(checklistable: japan_checklist, item: passport)
ChecklistItem.create!(checklistable: japan_checklist, item: flight_tickets)
ChecklistItem.create!(checklistable: japan_checklist, item: hotel_reservation)
ChecklistItem.create!(checklistable: japan_checklist, item: travel_insurance)
ChecklistItem.create!(checklistable: japan_checklist, item: credit_card)

# VIETNAM CHECKLIST ITEMS
ChecklistItem.create!(checklistable: vietnam_checklist, item: passport)
ChecklistItem.create!(checklistable: vietnam_checklist, item: flight_tickets)
ChecklistItem.create!(checklistable: vietnam_checklist, item: hotel_reservation)
ChecklistItem.create!(checklistable: vietnam_checklist, item: travel_insurance)
ChecklistItem.create!(checklistable: vietnam_checklist, item: credit_card)

# ITALY CHECKLIST ITEMS
ChecklistItem.create!(checklistable: italy_checklist, item: passport)
ChecklistItem.create!(checklistable: italy_checklist, item: flight_tickets)
ChecklistItem.create!(checklistable: italy_checklist, item: hotel_reservation)
ChecklistItem.create!(checklistable: italy_checklist, item: travel_insurance)
ChecklistItem.create!(checklistable: italy_checklist, item: credit_card)

# FRANCE CHECKLIST ITEMS
ChecklistItem.create!(checklistable: france_checklist, item: passport)
ChecklistItem.create!(checklistable: france_checklist, item: flight_tickets)
ChecklistItem.create!(checklistable: france_checklist, item: hotel_reservation)
ChecklistItem.create!(checklistable: france_checklist, item: travel_insurance)
ChecklistItem.create!(checklistable: france_checklist, item: credit_card)

# CITY LIST LOUNIS ITEMS
ChecklistItem.create!(checklistable: city_list_lounis, item: passport)
ChecklistItem.create!(checklistable: city_list_lounis, item: flight_tickets)
ChecklistItem.create!(checklistable: city_list_lounis, item: hotel_reservation)
ChecklistItem.create!(checklistable: city_list_lounis, item: travel_insurance)
ChecklistItem.create!(checklistable: city_list_lounis, item: credit_card)
ChecklistItem.create!(checklistable: city_list_lounis, item: cash)
ChecklistItem.create!(checklistable: city_list_lounis, item: phone_charger)
ChecklistItem.create!(checklistable: city_list_lounis, item: camera)
ChecklistItem.create!(checklistable: city_list_lounis, item: medication)
ChecklistItem.create!(checklistable: city_list_lounis, item: first_aid_kit)
ChecklistItem.create!(checklistable: city_list_lounis, item: toothbrush)
ChecklistItem.create!(checklistable: city_list_lounis, item: toothpaste)
ChecklistItem.create!(checklistable: city_list_lounis, item: shampoo)
ChecklistItem.create!(checklistable: city_list_lounis, item: conditioner)
ChecklistItem.create!(checklistable: city_list_lounis, item: body_wash)
ChecklistItem.create!(checklistable: city_list_lounis, item: headphones)
ChecklistItem.create!(checklistable: city_list_lounis, item: umbrella)

# BEACH LIST LOUNIS ITEMS
ChecklistItem.create!(checklistable: beach_list_lounis, item: sunscreen)
ChecklistItem.create!(checklistable: beach_list_lounis, item: sunglasses)
ChecklistItem.create!(checklistable: beach_list_lounis, item: flip_flops)
ChecklistItem.create!(checklistable: beach_list_lounis, item: swimsuit)
ChecklistItem.create!(checklistable: beach_list_lounis, item: beach_towel)
ChecklistItem.create!(checklistable: beach_list_lounis, item: book)
ChecklistItem.create!(checklistable: beach_list_lounis, item: hat)

# BACKPACKING LIST LOUNIS ITEMS
ChecklistItem.create!(checklistable: backpacking_list_lounis, item: raincoat)
ChecklistItem.create!(checklistable: backpacking_list_lounis, item: jacket)
ChecklistItem.create!(checklistable: backpacking_list_lounis, item: sweater)
ChecklistItem.create!(checklistable: backpacking_list_lounis, item: scarf)
ChecklistItem.create!(checklistable: backpacking_list_lounis, item: gloves)
ChecklistItem.create!(checklistable: backpacking_list_lounis, item: hiking_boots)
ChecklistItem.create!(checklistable: backpacking_list_lounis, item: backpack)
ChecklistItem.create!(checklistable: backpacking_list_lounis, item: sleeping_bag)

puts "Checklist items created!"

puts 'Seeding completed successfully!'
marseille = Stop.create!(trip: france, name: "Marseille", start_date: "2024-12-27", end_date: "2025-01-02",
address: "Marseille, France")

first_entry = DiaryEntry.create!(
  headline: "This was a Beautyful first day",
  content: "Florence, the city of art, took my breath away. The Uffizi Gallery was a highlight of the trip, with its vast collection of Renaissance masterpieces. Standing in front of Botticelli's 'The Birth of Venus' was an awe-inspiring moment. The Duomo, with its stunning dome designed by Brunelleschi, dominates the skyline. Florence is a city where beauty and history meet at every corner, leaving a lasting impression.",
  date: "2024-12-27",
  trip: italy)

first_entry = DiaryEntry.create!(
  headline: "This was a Beautyful first day",
  content: "lorem Ipsum",
  date: "2024-12-27",
  trip: italy)

first_entry = DiaryEntry.create!(
  headline: "Exploring the Streets of Rome",
  content: "Today, I wandered through the ancient streets of Rome. The Colosseum was even more magnificent in person than I had imagined. The warm Italian sun bathed the city in golden light, and I could feel the history beneath my feet. As I sipped my cappuccino at a small café, I realized that this city has a charm that is truly timeless. I can’t wait to see what tomorrow holds.",
  date: "2024-12-27",
  trip: italy
)

second_entry = DiaryEntry.create!(
  headline: "A Day in Venice",
  content: "Venice greeted us with its winding canals and graceful bridges. We took a gondola ride through the waterways, which felt like stepping back in time. The palazzos lining the canals are exquisite, and every corner of this city has a story to tell. I spent the afternoon getting lost in the labyrinth of streets, discovering hidden squares and beautiful churches. Venice is a place where time seems to stand still.",
  date: "2024-12-28",
  trip: italy
)

third_entry = DiaryEntry.create!(
  headline: "Florence: Cradle of the Renaissance",
  content: "Florence, the city of art, took my breath away. The Uffizi Gallery was a highlight of the trip, with its vast collection of Renaissance masterpieces. Standing in front of Botticelli's 'The Birth of Venus' was an awe-inspiring moment. The Duomo, with its stunning dome designed by Brunelleschi, dominates the skyline. Florence is a city where beauty and history meet at every corner, leaving a lasting impression.",
  date: "2024-12-29",
  trip: italy
)

fourth_entry = DiaryEntry.create!(
  headline: "Tuscany’s Rolling Hills",
  content: "The Tuscan countryside is as picturesque as the postcards depict. Rolling hills dotted with vineyards and olive groves stretch as far as the eye can see. We visited a small vineyard today and tasted some of the finest wines I’ve ever had. The air is crisp, and the sky is a perfect shade of blue. Tuscany’s beauty lies in its simplicity, and it’s a place where one can truly relax and appreciate life.",
  date: "2024-12-30",
  trip: italy
)

fifth_entry = DiaryEntry.create!(
  headline: "Amalfi Coast Adventure",
  content: "The Amalfi Coast is a dream come true. The cliffs plunge dramatically into the turquoise sea, and the towns cling precariously to the rocks. We drove along the coast, stopping in Positano for lunch with a view. The food is incredible—fresh seafood, lemon-scented everything, and the best gelato I’ve ever tasted. This place feels like paradise, and I wish I could stay here forever. Italy’s beauty is unparalleled.",
  date: "2024-12-31",
  trip: italy
)
