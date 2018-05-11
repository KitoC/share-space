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

  x = Address.where(addressable_type: "SharespaceVenue", addressable_id: row['id'])[0]
  x.address_line_one = row['street']
  x.state = row['state']
  x.city_suburb = row['city']
  x.save

  ss = Sharespace.new
  ss.sharespace_venue_id = rand(1...20)
  ss.space_type = "Desk"
  ss.cost = rand(20.00...90.00)
  ss.save


  puts " address success"

end



require 'csv'
csv_text = File.read(Rails.root.join('lib', 'seeds', 'Reviews.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|

  # MAKE SURE YOU PLACE THE ID HERE TOO


  x = Booking.new(user_id: rand(1...20), sharespace_id: rand(1...20), date_from: SharespaceVenue.first.created_at, date_to: SharespaceVenue.first.created_at, paid: true)
  x.save
  puts "#{x}"

  t = Review.new
  t.rating = rand(1...5)
  t.review = row['review']
  t.reviewable_id = rand(1...20)
  t.reviewable_type = "SharespaceVenue"
  t.reference_id = rand(1...20)
  t.reference_type = "Booking"
  t.save
  puts "success"

end
