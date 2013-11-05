# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = UserType.create!(name: 'admin')
analyst = UserType.create!(name: 'analyst')
intern = UserType.create!(name: 'intern')

testUser = User.create!(email: 'lujeri@berkeley.edu', password: 'foobarbaz', password_confirmation: 'foobarbaz')
testUser.user_type = admin
testUser.save!
