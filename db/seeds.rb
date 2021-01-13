# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

100.times do |n|
  name = "name#{n+1}"
  furigana_name = "furigana#{n+1}"
  email = "example-#{n+1}@example.com"
  password = "password"
  age = "#{n+1}"
  street_address = "street_address#{n+1}"
  tel = "080000#{n+1}"
  User.create!(name: name,
               furigana_name: furigana_name,
               email: email,
               password:              password,
               password_confirmation: password,
               age: age,
               gender: 1,
               street_address: street_address,
               tel: tel,
               pets_allowed: 1,
               living: 1,
               vaccination: 1)
end

100.times do |n|
  email = "example-#{n+1}@example.com"
  password = "password"
  FosterParentRecruiter.create!(email: email,
               password:              password,
               password_confirmation: password)
end

100.times do |n|
  email = "example-#{n+1}@example.com"
  password = "password"
  Center.create!(email: email,
               password:              password,
               password_confirmation: password)
end