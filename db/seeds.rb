# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Feature.count == 0
  features = ["all", "accessibple", "basketball", "bbq", "bins", "botanical", "cultural", "educational", "events", "exercise", "fenced", "food nearby", "farm", "grassed", "heritage", "lake", "market", "playground", "river", "seating", "shelter", "skate", "toilets", "velodrome"]
  features.each do |feature|
    Feature.create(name: feature)
    puts "Created #{feature} feature"
  end
  puts "Created features"
end

if Category.count == 0
  categories = ["all", "community", "child friendly", "dog park", "large park", "nature", "skatepark", "sports"]
  categories.each do |category|
    Category.create(name: category)
    puts "Created #{category} category"
  end
end

if User.count == 0
  User.create(username: "alice", email: "alice@picvic.com.au", password: "Apicvic", password_confirmation: "Apicvic")
  User.create(username: "bob", email: "bob@picvic.com.au", password: "Bpicvic", password_confirmation: "Bpicvic")
  User.create(username: "charlie", email: "charlie@picvic.com.au", password: "Cpicvic", password_confirmation: "Cpicvic")
  puts "Created users"
end

if Address.count == 0
  Address.create(street: "St Kilda Road", suburb: "Melbourne", postcode: "3004")
  Address.create(number: 1, street: "K Road", suburb: "Werribee", postcode: "3029")
  Address.create(number: 40, street: "Maribyrnong Blvd", suburb: "Footscray", postcode: "3011")
  puts "Created addresses"
end

if Park.count == 0
  Park.create(category_id: 6, feature_id: 6, address_id: 1, name: "Royal Botanical Gardens", cheese: "Brie", wine: "Red wine", latitude: -37.8300822, longitude: 144.9754787)
  Park.create(category_id: 2, feature_id: 9, address_id: 2, name: "Werribee Park", cheese: "Bocconcini", wine: "Merlot", latitude: -37.9400935, longitude: 144.6711291)
  Park.create(category_id: 5, feature_id: 2, address_id: 3, name: "Footscray Park", cheese: "Bocconcini", wine: "Merlot", latitude: -377930638, longitude: 144.9049412)
  puts "Created parks"
end

if Post.count == 0
  Post.create(user_id: 1, park_id: 1, comment: "This park is really pretty!!!!", rating: 4)
  Post.create(user_id: 2, park_id: 2, comment: "So many flowers!!! So many colours. So beautiful", rating: 5)
  Post.create(user_id: 3, park_id: 3, comment: "Pretty meh park", rating: 1)
  puts "Created post for park"
end
