# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([= name: 'Star Wars' , = name: 'Lord of the Rings' ])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |n|
  name = Gimei.kanji 
  furigana_name = Gimei.hiragana
  email = Faker::Internet.email 
  password = 'password' 
  password_confirmation = 'password' 
  age = Faker::Number.within(range: 15..68)
  gender = Faker::Boolean.boolean(true_ratio: 0.5) 
  street_address = Gimei.address
  tel = Faker::PhoneNumber.cell_phone
  User.create!(
    name: name,
    furigana_name: furigana_name,
    email: email,
    password: password,
    password_confirmation: password_confirmation,
    age: age,
    gender: gender,
    street_address: street_address,
    tel: tel,
    pets_allowed: true,
    living: true,
    vaccination: true
    )
end