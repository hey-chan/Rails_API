# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Category.count == 0
  categories = ["all", "community", "child friendly", "dog park", "large park", "nature", "skatepark", "sports"]
  categories.each do |category|
    Category.create(name: category)
    puts "Created #{category} category"
  end
  puts "Created categories"
end

if Feature.count == 0
  features = ["all", "accessible", "basketball", "bbq", "bins", "botanical", "cultural", "educational", "events", "exercise", "fenced", "food nearby", "farm", "grassed", "heritage", "lake", "market", "playground", "river", "seating", "shelter", "skate", "toilets", "velodrome"]
  features.each do |feature|
    Feature.create(name: feature)
    puts "Created #{feature} feature"
  end
  puts "Created features"
end

if User.count == 0
  User.create(username: "test", email: "test@picvic.com.au", password: "picvic", password_confirmation: "picvic")
  puts "Created a user"
end
