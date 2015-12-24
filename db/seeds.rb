# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(
  name: 'adam pahlevi',
  email: 'adam.pahlevi@example.com',
  password: 'Password01'
)

User.create(
  name: 'wendy kurniawan',
  email: 'wendy.kurniawan@example.com',
  password: 'Password01'
)
