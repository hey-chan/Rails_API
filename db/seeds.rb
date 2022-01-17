# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Feature.count == 0
  features = ["all", "accessible", "basketball", "bbq", "bins", "botanical", "cultural", "educational", "events", "exercise", "fenced", "food nearby", "farm", "grassed", "heritage", "lake", "market", "playground", "river", "seating", "shelter", "skate", "toilets", "velodrome"]
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
  User.create(username: "admin", email: "admin@picvic.com.au", password: "adminPic", password_confirmation: "adminPic", admin: true)
  User.create(username: "bob", email: "bob@picvic.com.au", password: "Bpicvic", password_confirmation: "Bpicvic", admin: false)
  User.create(username: "charlie", email: "charlie@picvic.com.au", password: "Cpicvic", password_confirmation: "Cpicvic", admin: false)
  puts "Created users"
end

if Address.count == 0
  Address.create(street: "St Kilda Road", suburb: "Melbourne", postcode: "3004")
  Address.create(number: 1, street: "K Road", suburb: "Werribee", postcode: "3029")
  Address.create(number: 40, street: "Maribyrnong Blvd", suburb: "Footscray", postcode: "3011")
  Address.create(number: 69, street: "A Street", suburb: "St Kilda", postcode: "3011")
  puts "Created addresses"
end

if Park.count == 0
  Park.create(category_id: rand(7) + 1, feature_id: rand(23) + 1, address_id: 1, user_id: 1, name: "Royal Botanical Gardens", cheese: "Brie", wine: "Red wine", latitude: -37.8300822, longitude: 144.9754787)
  Park.create(category_id: rand(7) + 1, feature_id: rand(23) + 1, address_id: 2, user_id: 1, name: "Werribee Park", cheese: "Bocconcini", wine: "Merlot", latitude: -37.9400935, longitude: 144.6711291)
  Park.create(category_id: rand(7) + 1, feature_id: rand(23) + 1, address_id: 3, user_id: 1, name: "Footscray Park", cheese: "Bocconcini", wine: "Merlot", latitude: -377930638, longitude: 144.9049412)
  puts "Created parks"
end

if Post.count == 0
  Post.create(user_id: rand(2) + 1, park_id: rand(2) + 1, comment: "This park is really pretty!!!!", rating: 4)
  Post.create(user_id: rand(2) + 1, park_id: rand(2) + 1, comment: "So many flowers!!! So many colours. So beautiful", rating: 5)
  Post.create(user_id: rand(2) + 1, park_id: rand(2) + 1, comment: "Pretty meh park", rating: 1)
  Post.create(user_id: rand(2) + 1, park_id: rand(2) + 1, comment: "Worse park is the history of all parks!", rating: 2)
  Post.create(user_id: rand(2) + 1, park_id: rand(2) + 1, comment: "This is a park that exists", rating: 2)
  puts "Created post for park"
end

Park.first.picture.attach(io: File.open(File.join(Rails.root, "app/assets/images/testpic.jpeg")), filename: "testpic.jpeg")
