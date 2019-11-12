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
yann = User.create!(name: 'Yann', email: 'yann@gmail.com', password: '1234567890')
doug = User.create!(name: 'Doug', email: 'doug@gmail.com', password: '1234567890')

puts "Create gadgets"
3.times do
  Techget.create!(
    name: "#{Faker::Hipster.word.capitalize} #{Faker::Appliance.equipment}",
    description: "#{Faker::ChuckNorris.fact}",
    user: yann
    )
end

3.times do
  Techget.create!(
    name: "#{Faker::Hipster.word.capitalize} #{Faker::Appliance.equipment}",
    description: "#{Faker::ChuckNorris.fact}",
    user: doug
    )
end

puts "Create a rental"
Rental.create!(
  renter: yann,
  rentee: doug,
  techget: yann.techgets.first,
  start: DateTime.new(2019,11,14),
  end: DateTime.new(2019,11,16)
)

puts "Seeding finished!"
