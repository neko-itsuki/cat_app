# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([= name: 'Star Wars' , = name: 'Lord of the Rings' ])
#   Character.create(name: 'Luke', movie: movies.first)

require 'aws-sdk-s3' 

# User
  email = 'guest-user@example.com'
  password = 'guest-user'
  password_confirmation = 'guest-user' 
  name = "ゲストユーザー"
  furigana_name = "げすとゆーざー"
  age = 25
  gender = "男"
  postcode = "1001000"
  prefecture_code = '東京都'
  address_city = '市区町村'
  address_street = '番地'
  address_building = '建物'
  tel = "09012345678"
  User.create!(
    name: name,
    furigana_name: furigana_name,
    email: email,
    password: password,
    password_confirmation: password_confirmation,
    age: age,
    gender: gender,
    postcode: postcode,
    prefecture_code: prefecture_code,
    address_city: address_city,
    address_street: address_street,
    address_building: address_building,
    tel: tel,
    pets_allowed: true,
    living: true,
    vaccination: true
    )

# Center
  email = 'guest-center@example.com'
  password = 'guest-center'
  password_confirmation = 'guest-center' 
  name = "ゲストセンター"
  furigana_name = "げすとせんたー"
  director_name = "ゲスト"
  staff_name = "ゲスト"
  postcode = "1001000"
  prefecture_code = '東京都'
  address_city = '市区町村'
  address_street = '番地'
  address_building = '建物'
  tel = "09012345678"
  Center.create!(
    name: name,
    furigana_name: furigana_name,
    email: email,
    password: password,
    password_confirmation: password_confirmation,
    director_name: director_name,
    staff_name: staff_name,
    postcode: postcode,
    prefecture_code: prefecture_code,
    address_city: address_city,
    address_street: address_street,
    address_building: address_building,
    tel: tel,
    approval: true,
    release: true,
    listok: true
    )

# Centers
30.times do |n|
  name = "保護センター#{rand(1..47)}" 
  furigana_name = "ほごせんたー"
  email = Faker::Internet.email 
  password = 'password' 
  password_confirmation = 'password' 
  director_name = Gimei.kanji
  staff_name = Gimei.kanji
  postcode = "1001000"
  prefecture_code = rand(1..47)
  address_city = '市区町村'
  address_street = '番地'
  address_building = '建物'
  tel = "09012345678"
  Center.create!(
    name: name,
    furigana_name: furigana_name,
    email: email,
    password: password,
    password_confirmation: password_confirmation,
    director_name: director_name,
    staff_name: staff_name,
    postcode: postcode,
    prefecture_code: prefecture_code,
    address_city: address_city,
    address_street: address_street,
    address_building: address_building,
    tel: tel,
    approval: true,
    release: true,
    listok: true
    )
end

center = Center.find_by(name: "ゲストセンター")
9.times do |n|
  center.cats.create!(
    cat_name: Faker::Creature::Cat.name,
    cat_type: '雑種',
    cat_gender: 'オス',
    cat_age: Faker::Number.within(range: 1..18) ,
    cat_weight: "#{rand(2..5)}kg" ,
    cat_coat_color: 'キジ' ,
    cat_image: open("./spec/fixtures/cats/#{n + 1}.jpeg"),
    cat_contraceptive_castrated: '済',
    cat_microchip: '済' ,
    cat_vaccination: '済',
    cat_one_thing: 'とても人懐こくていい子です。トイレもばっちりできます!' ,
    cat_health: '良好' ,
    cat_personality: '人懐こい' ,
    cat_history_of_protection: '飼い主の引っ越しにより飼えなくなった' ,
    cat_remarks: '可能であれば2匹一緒に引き取りをご検討ください。' ,
    cat_center_information: 'のび動物病院
                〒100-1000 東京都
                http://www.center.jp/' 
  )
end

center = Center.find_by(name: "ゲストセンター")
9.times do |n|
  center.dogs.create!(
    dog_name: Faker::Creature::Dog.name,
    dog_type: '柴犬',
    dog_gender: 'オス',
    dog_age: Faker::Number.within(range: 1..18) ,
    dog_weight: "#{rand(2..7)}kg" ,
    dog_coat_color: '茶白' ,
    dog_image: open("./spec/fixtures/dogs/#{n + 1}.jpeg"),
    dog_contraceptive_castrated: '済',
    dog_microchip: '済' ,
    dog_vaccination: '済',
    dog_one_thing: 'とても人懐こくていい子です。トイレもばっちりできます!' ,
    dog_health: '良好' ,
    dog_personality: '人懐こい' ,
    dog_history_of_protection: '飼い主の引っ越しにより飼えなくなった' ,
    dog_remarks: '可能であれば2匹一緒に引き取りをご検討ください。' ,
    dog_center_information: 'のび動物病院
                〒100-1000 東京都
                http://www.center.jp/' 
  )
end
