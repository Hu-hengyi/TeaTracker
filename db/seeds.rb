# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


testUser = Admin.new(name: 'Tea Master', email: 'admin@lujeri.com', password: 'foobarbaz')
testUser.skip_confirmation!
testUser.save!


### __Demo Data__ ###

# FARMS
kafele = Farm.create!(name: "Kafele",
  latitude: -16.00267,
  longitude: 35.60445,
  workers: 2,
  bushes: 8,
  notes: "")
ateefah = Farm.create!(name: "Ateefah",
  latitude: -15.98880,
  longitude: 35.67723,
  workers: 3,
  bushes: 11,
  notes: "")
mwai = Farm.create!(name: "Mwai",
  latitude: -15.94589,
  longitude: 35.74006,
  workers: 3,
  bushes: 6,
  notes: "Rough road in")
unika = Farm.create!(name: "Unika",
  latitude: -16.03434,
  longitude: 35.78675,
  workers: 1,
  bushes: 4,
  notes: "")

# COLLECTION POINTS
east = Cp.create!(name: "East Pickup",
  latitude: -16.01323,
  longitude: 35.60719)

west= Cp.create!(name: "West Pickup",
  latitude: -15.97857,
  longitude: 35.76272)

# DEPOSITS
d = Deposit.new(weight: 12.23, quality: Deposit.all_qualities[1], weighed_at: 1.month.ago)
d.farm = kafele
d.cp = west
d.save!

d = Deposit.new(weight: 15.81, quality: Deposit.all_qualities[3], weighed_at: 2.weeks.ago)
d.farm = ateefah
d.cp = west
d.save!

d = Deposit.new(weight: 4.41, quality: Deposit.all_qualities[0], weighed_at: 1.day.ago)
d.farm = mwai
d.cp = east
d.save!

d = Deposit.new(weight: 4.40, quality: Deposit.all_qualities[2],  weighed_at: 1.day.ago)
d.farm = unika
d.cp = east
d.save!

d = Deposit.new(weight: 7000, quality: Deposit.all_qualities[2],  weighed_at: 2.day.ago)
d.farm = unika
d.cp = east
d.save!

