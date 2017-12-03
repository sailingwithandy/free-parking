# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Seed Users
user = {}
user['password'] = 'asdf'
user['confirmation_token'] = 'asdf'

ActiveRecord::Base.transaction do
  20.times do 
    user['name'] = Faker::Name.first_name 
    user['email'] = Faker::Internet.email
    User.create(user)
  end
end 

# Seed Listings
listing = {}
uids = []
User.all.each { |u| uids << u.id }

ActiveRecord::Base.transaction do
  40.times do 
    listing['title'] = ["private driveway", "street parking", "garage", "parking lot"].sample
    listing['city'] = Faker::Address.city
    listing['address'] = Faker::Address.street_address
    listing['price'] = rand(1..10)
    listing['user_id'] = uids.sample
    Listing.create(listing)
  end
end