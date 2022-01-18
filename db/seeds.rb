# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Feature.count == 0
  features = ["all", "accessible", "basketball", "bbq", "bins", "botanical", "cultural", "educational", "events", "exercise", "fenced", "food nearby", "farm", "grassed", "heritage", "lake", "market", "playground", "seating", "shelter", "skate", "toilets", "velodrome"]
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
  Address.create(street: "Separation Street", suburb: "Northcote", postcode: "3070")
  Address.create(number: 1, street: "Flemington Road", suburb: "Parkville", postcode: "3052")
  Address.create(street: "Alma Rd", suburb: "Windsor", postcode: "3181")
  Address.create(number: 23, street: "Fordham Rd", suburb: "Reservoir", postcode: "3073")
  Address.create(street: "Mt Alexander Rd &, Kellaway Ave", suburb: "Moonee Ponds ", postcode: "3039")
  Address.create(suburb: "Maribyrnong", postcode: "3032")
  Address.create(street: "Battery Rd", suburb: "Williamstown", postcode: "3016")
  Address.create(number: 2, street: "K Road", suburb: "Werribee South", postcode: "3030")
  Address.create(street: "Birdwood Ave", suburb: "South Yarra", postcode: "3141")
  Address.create(number: 111, street: "Carlton St", suburb: "Carlton", postcode: "3053")
  Address.create(street: "Not listed")
  puts "Created addresses"
end

if Park.count == 0
  Park.create(category_id: 2, feature_id: 12, address_id: 1, user_id: 1, name: "All Nations Park", latitude: -37.7681, longitude: 145.0017)
  Park.create(category_id: 4, feature_id: 2, address_id: 2, user_id: 1, name: "Royal Park", latitude: -37.79246, longitude: 144.9534)
  Park.create(category_id: 3, feature_id: 8, address_id: 3, user_id: 1, name: "Alma Park", latitude: -37.8611, longitude: 144.9926)
  Park.create(category_id: 3, feature_id: 14, address_id: 4, user_id: 1, name: "T.W. Andrews Reserve", latitude: -37.7166, longitude: 145.0170)
  Park.create(category_id: 5, feature_id: 20, address_id: 5, user_id: 1, name: "Queens Park", latitude: -37.7678, longitude: 144.9221)
  Park.create(category_id: 3, feature_id: 18, address_id: 6, user_id: 1, name: "Pipemakers Park", latitude: -37.7789, longitude: 144.8945)
  Park.create(category_id: 6, feature_id: 15, address_id: 7, user_id: 1, name: "Point Gellibrand Coastal Heritage Park", latitude: -37.8737, longitude: 144.8892)
  Park.create(category_id: 3, feature_id: 15, address_id: 8, user_id: 1, name: "Werribee Park Mansion", latitude: -37.9396, longitude: 144.6713)
  Park.create(category_id: 6, feature_id: 6, address_id: 9, user_id: 1, name: "Royal Botanical Gardens", latitude: -37.8345, longitude: 144.9773)
  Park.create(category_id: 1, feature_id: 1, address_id: 10, user_id: 1, name: "Carlton Gardens", latitude: -37.8122, longitude: 144.9620)
  puts "Created parks"
end

if Post.count == 0
  Post.create(user_id: rand(2) + 1, park_id: 1, comment: "This park is really pretty!!!!", rating: 4)
  Post.create(user_id: rand(2) + 1, park_id: 2, comment: "So many flowers!!! So many colours. So beautiful", rating: 5)
  Post.create(user_id: rand(2) + 1, park_id: 3, comment: "Pretty meh park", rating: 1)
  Post.create(user_id: rand(2) + 1, park_id: 4, comment: "Worse park is the history of all parks!", rating: 2)
  Post.create(user_id: rand(2) + 1, park_id: 5, comment: "This park's playground has no fences and isn't appropriate for children.", rating: 2)
  Post.create(user_id: rand(2) + 1, park_id: 6, comment: "This is a park that exists", rating: 2)
  puts "I got yelled at for having my dog off leash."
end

# Park.first.picture.attach(io: File.open(File.join(Rails.root, "app/assets/images/testpic.jpeg")), filename: "testpic.jpeg")
