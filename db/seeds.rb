# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'csv'
csv_text = File.read(Rails.root.join('lib', 'seeds', 'users.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = User.new
  # MAKE SURE YOU PLACE THE ID HERE TOO



  t.first_name = row['first_name']
  t.last_name = row['last_name']
  t.email = row['email']
  t.password = row['password']
  t.password_confirmation = row['password']
  t.save
  puts "success"

end


require 'csv'
csv_text = File.read(Rails.root.join('lib', 'seeds', 'venues.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = SharespaceVenue.new
  # MAKE SURE YOU PLACE THE ID HERE TOO



  t.name = row['name']
  t.user_id = row['user_id']
  t.save

  puts "success"

end



require 'csv'
csv_text = File.read(Rails.root.join('lib', 'seeds', 'photos.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Photo.new
  # MAKE SURE YOU PLACE THE ID HERE TOO

  t.image = row['image']
  t.photoable_type = "SharespaceVenue"
  t.photoable_id = row['id']
  x = Address.where(addressable_type: "SharespaceVenue", addressable_id: row['id'])[0]
  x.address_line_one = row['street']
  x.state = row['state']
  x.city_suburb = row['city']
  x.save
  t.save
  puts "success"

end

require 'csv'
csv_text = File.read(Rails.root.join('lib', 'seeds', 'venues.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Review.new

  # MAKE SURE YOU PLACE THE ID HERE TOO



  t.rating = row['rating']
  t.review = row['review']
  t.reviewable_id = row['reviewable_id']
  t.reviewable_type = "SharespaceVenue"
  t.save
  puts "success"

end
