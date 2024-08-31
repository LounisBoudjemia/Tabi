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
DiaryEntry.destroy_all
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

# VIETNAM STOPS
hanoi = Stop.create!(trip: vietnam, name: "Hanoi", start_date: "2022-06-25", end_date: "2022-06-28",
    address: "Hanoi, Vietnam")

saigon = Stop.create!(trip: vietnam, name: "Ho Chi Minh", start_date: "2022-06-28", end_date: "2022-07-01",
    address: "Ho Chi Minh City, Vietnam")

hue = Stop.create!(trip: vietnam, name: "Hue", start_date:  "2022-07-01", end_date: "2022-07-02",
    address: "Hué, Vietnam")

hoian = Stop.create!(trip: vietnam, name: "Hoi An", start_date: "2022-07-02", end_date: "2022-07-06",
    address: "Hoi-An, Vietnam")

# ITALY STOPS
verona = Stop.create!(trip: italy, name: "Verona", start_date: "2019-05-11", end_date: "2019-05-13",
    address: "Verona,Italy")

bologna = Stop.create!(trip: italy, name: "Bologna", start_date: "2019-05-13", end_date: "2019-05-16",
    address: "Bologna,Italy")

florence = Stop.create!(trip: italy, name: "Florence", start_date:  "2019-05-16", end_date: "2019-05-20",
    address: "Florence,Italy")

siena = Stop.create!(trip: italy, name: "Siena", start_date: "2019-05-20", end_date: "2019-05-23",
    address: "Siena,Italy")

# FRANCE STOPS
paris = Stop.create!(trip: france, name: "Paris", start_date: "2024-12-21", end_date: "2024-12-23",
address: "Paris, France")

lyon = Stop.create!(trip: france, name: "Lyon", start_date: "2024-12-23", end_date: "2024-12-27",
address: "Lyon, France")

marseille = Stop.create!(trip: france, name: "Marseille", start_date: "2024-12-27", end_date: "2025-01-02",
address: "Marseille, France")

montpellier = Stop.create!(trip: france, name: "Montpellier", start_date: "2025-01-02", end_date: "2025-01-05",
address: "Montpellier, France")

puts "Stops created!"

# CREATE ACTIVITIES
Activity.create!(stop: hiro, name: "Peace Memorial Museum",
              start_date:"2023-09-07", favorite: true, category: "Museum",
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
passport = Item.create!(name: "Passport", checked: false)
flight_tickets = Item.create!(name: "Flight tickets", checked: false)
hotel_reservation = Item.create!(name: "Hotel reservation", checked: false)
travel_insurance = Item.create!(name: "Travel insurance", checked: false)
credit_card = Item.create!(name: "Credit card", checked: false)
cash = Item.create!(name: "Cash", checked: false)
phone_charger = Item.create!(name: "Phone charger", checked: false)
camera = Item.create!(name: "Camera", checked: false)
toothbrush = Item.create!(name: "Toothbrush", checked: false)
toothpaste = Item.create!(name: "Toothpaste", checked: false)
shampoo = Item.create!(name: "Shampoo", checked: false)
conditioner = Item.create!(name: "Conditioner", checked: false)
body_wash = Item.create!(name: "Body wash", checked: false)
sunscreen = Item.create!(name: "Sunscreen", checked: false)
sunglasses = Item.create!(name: "Sunglasses", checked: false)
hat = Item.create!(name: "Hat", checked: false)
flip_flops = Item.create!(name: "Flip flops", checked: false)
swimsuit = Item.create!(name: "Swimsuit", checked: false)
beach_towel = Item.create!(name: "Beach towel", checked: false)
book = Item.create!(name: "Book", checked: false)
headphones = Item.create!(name: "Headphones", checked: false)
medication = Item.create!(name: "Medication", checked: false)
first_aid_kit = Item.create!(name: "First aid kit", checked: false)
umbrella = Item.create!(name: "Umbrella", checked: false)
raincoat = Item.create!(name: "Raincoat", checked: false)
jacket = Item.create!(name: "Jacket", checked: false)
sweater = Item.create!(name: "Sweater", checked: false)
scarf = Item.create!(name: "Scarf", checked: false)
gloves = Item.create!(name: "Gloves", checked: false)
hat = Item.create!(name: "Hat", checked: false)
hiking_boots = Item.create!(name: "Hiking boots", checked: false)
backpack = Item.create!(name: "Backpack", checked: false)
sleeping_bag = Item.create!(name: "Sleeping bag", checked: false)

puts "Items created!"

# CHECKLIST ITEMS
ChecklistItem.create!(checklist: japan_checklist, item: passport)
ChecklistItem.create!(checklist: japan_checklist, item: flight_tickets)
ChecklistItem.create!(checklist: japan_checklist, item: hotel_reservation)
ChecklistItem.create!(checklist: japan_checklist, item: travel_insurance)
ChecklistItem.create!(checklist: japan_checklist, item: credit_card)

ChecklistItem.create!(checklist: vietnam_checklist, item: passport)
ChecklistItem.create!(checklist: vietnam_checklist, item: flight_tickets)
ChecklistItem.create!(checklist: vietnam_checklist, item: hotel_reservation)
ChecklistItem.create!(checklist: vietnam_checklist, item: travel_insurance)
ChecklistItem.create!(checklist: vietnam_checklist, item: credit_card)

ChecklistItem.create!(checklist: italy_checklist, item: passport)
ChecklistItem.create!(checklist: italy_checklist, item: flight_tickets)
ChecklistItem.create!(checklist: italy_checklist, item: hotel_reservation)
ChecklistItem.create!(checklist: italy_checklist, item: travel_insurance)
ChecklistItem.create!(checklist: italy_checklist, item: credit_card)

ChecklistItem.create!(checklist: france_checklist, item: passport)
ChecklistItem.create!(checklist: france_checklist, item: flight_tickets)
ChecklistItem.create!(checklist: france_checklist, item: hotel_reservation)
ChecklistItem.create!(checklist: france_checklist, item: travel_insurance)
ChecklistItem.create!(checklist: france_checklist, item: credit_card)

ChecklistItem.create!(checklist: city_list_lounis, item: passport)
ChecklistItem.create!(checklist: city_list_lounis, item: flight_tickets)
ChecklistItem.create!(checklist: city_list_lounis, item: hotel_reservation)
ChecklistItem.create!(checklist: city_list_lounis, item: travel_insurance)

puts "Checklist items created!"

# DIARY ENTRIES JAPAN TRIP
DiaryEntry.create!(trip: japan, headline: "First day in Japan", content: "We arrived in Japan and we are so excited to start our trip!")
DiaryEntry.create!(trip: japan, headline: "Day 2 in Japan", content: "We visited the peace memorial museum and it was very emotional.")
DiaryEntry.create!(trip: japan, headline: "Day 3 in Japan", content: "We went to the Toyo Carps baseball game and it was so much fun!")
DiaryEntry.create!(trip: japan, headline: "Day 4 in Japan", content: "We went to Miyajima and it was so beautiful!")
DiaryEntry.create!(trip: japan, headline: "Day 5 in Japan", content: "We are now in Fukuoka and we are loving it!")
DiaryEntry.create!(trip: japan, headline: "Day 6 in Japan", content: "We are now in Okinawa and we are loving it!")
DiaryEntry.create!(trip: japan, headline: "Day 7 in Japan", content: "We are now in Nagoya and we are loving it!")

puts "Diary entries created!"

puts "Finished!"
