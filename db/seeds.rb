# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

print "Starting seeding"
print "."
print "."
puts "."

puts "Erase current data"
Rental.destroy_all
Techget.destroy_all
User.destroy_all

puts "Create users"
yann = User.create!(name: 'Yann', email: 'yann@gmail.com', password: '1234567890', long: 2.35, lat: 48.85)
doug = User.create!(name: 'Doug', email: 'doug@gmail.com', password: '1234567890', long: 2.45, lat: 48.95)

puts "Create gadgets"
# Leap motion
url = 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/df/Leap_Motion_Orion_Controller_Plugged.jpg/220px-Leap_Motion_Orion_Controller_Plugged.jpg'
techget = Techget.new(
  name: "Leap Mation",
  description: "The Leap Motion controller is a small USB peripheral device which is designed to be placed on a physical desktop, facing upward. It can also be mounted onto a virtual reality headset.",
  user: yann
  )
techget.remote_photo_url = url
techget.save!

# Oculus Quest
url = 'https://pisces.bbystatic.com/image2/BestBuy_US/images/products/6342/6342914_rd.jpg'
techget = Techget.new(
  name: "Oculus Quest",
  description: "Turn a small space into an immersive gaming area with this Oculus Quest all-in-one VR system. The wireless headset and controllers provide a compact setup and don't require a PC, and the 64GB of storage accommodate compatible VR game titles.",
  user: yann
  )
techget.remote_photo_url = url
techget.save!

# Apple Watch
url = 'https://cdn.mos.cms.futurecdn.net/8e29b93b0c94233dc2c16b9726762429-1280-80.jpg'
techget = Techget.new(
  name: "Apple Watch",
  description: "Apple Watch is a line of smartwatches designed, developed, marketed and sold by Apple Inc. It incorporates fitness tracking and health-oriented capabilities with integration with iOS and other Apple products and services.",
  user: yann
  )
techget.remote_photo_url = url
techget.save!

# 3D Doodler
url = 'https://cdn.ndtv.com/tech/images/gadgets/3doodler_2_0.jpg?output-quality=80&output-format=webp'
techget = Techget.new(
  name: "3D Doodler",
  description: "It's a 3D-printer in the loosest sense of the word - instead of a printer, the 3Doodler is basically a handheld extruder that would take a spool of plastic, and melt it, allowing you to write in thin air.",
  user: doug
  )
techget.remote_photo_url = url
techget.save!

# Panono
url = 'https://cdn.mos.cms.futurecdn.net/09ccc731ecddb18aa19d54b63a91bb6f-1280-80.jpg'
techget = Techget.new(
  name: "Panono",
  description: "The NFC Ring is a really simple concept. NFC capability is put into a sleek metal ring, and the wearer can use that ring to store data. The data is stored in two separate sections.",
  user: doug
  )
techget.remote_photo_url = url
techget.save!

puts "Create a rental"
Rental.create!(
  renter: yann,
  rentee: doug,
  techget: yann.techgets.first,
  start: DateTime.new(2019,11,14),
  end: DateTime.new(2019,11,16)
)

puts "Seeding finished!"
