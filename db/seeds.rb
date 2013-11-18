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
