# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([= name: 'Star Wars' , = name: 'Lord of the Rings' ])
#   Character.create(name: 'Luke', movie: movies.first)

# User
#   name = Gimei.kanji 
#   furigana_name = Gimei.hiragana
#   email = Faker::Internet.email 
#   password = 'password' 
#   password_confirmation = 'password' 
#   age = Faker::Number.within(range: 18..64)
#   gender = "男"
#   postcode = "1001000"
#   prefecture_code = '東京都'
#   address_city = '市区町村'
#   address_street = '番地'
#   address_building = '建物'
#   tel = "09012345678"
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

# Centers
30.times do |n|
  name = "保護センター#{rand(1..47)}" 
  furigana_name = "ほごせんたー"
  email = "center@example.com"
  password = 'password' 
  password_confirmation = 'password' 
  director_name = "斎藤"
  staff_name = "山田"
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
    
# Foster
  email = 'guest-center@example.com'
  password = 'guest-center'
  password_confirmation = 'guest-center' 
  name = "ゲストセンター"
  furigana_name = "げすとせんたー"
  age = 25
  gender = "男"
  postcode = "1001000"
  prefecture_code = '東京都'
  address_city = '市区町村'
  address_street = '番地'
  address_building = '建物'
  tel = "09012345678"
  tel_time = rand(1..5)
  animal_type = '雑種'
  animal_gender = "不明"
  animal_age = rand(0..20)
  animal_image = "app/assets/images/pickup_logo.gif"
  reason = "子供が産まれた、家族にアレルギーが発症した"
  FosterParentRecruiter.create!(
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
    tel_time: tel_time,
    animal_type: animal_type,
    animal_gender: animal_gender,
    animal_age: animal_age,
    animal_image: animal_image,
    reason: reason
    )

# center = Center.first
# 10.times do
#   center.cats.create!(
#     cat_name: Faker::Creature::Cat.name,
#     cat_type: '雑種',
#     cat_gender: 'オス',
#     cat_age: Faker::Number.within(range: 1..18) ,
#     cat_weight: "#{rand(2..5)}kg" ,
#     cat_coat_color: 'キジ' ,
#     cat_image_id: "./spec/fixtures/cat.jpeg",
#     cat_contraceptive_castrated: '済',
#     cat_microchip: '済' ,
#     cat_vaccination: '済',
#     cat_one_thing: 'とても人懐こくていい子です。トイレもばっちりできます!' ,
#     cat_health: '良好' ,
#     cat_personality: '人懐こい' ,
#     cat_history_of_protection: '飼い主の引っ越しにより飼えなくなった' ,
#     cat_remarks: '可能であれば2匹一緒に引き取りをご検討ください。' ,
#     cat_center_information: 'のび動物病院
#                 〒100-1000 東京都
#                 http://www.center.jp/' 
#   )
# end

# center = Center.second
# 10.times do
#   center.dogs.create!(
#     dog_name: Faker::Creature::Dog.name,
#     dog_type: '柴犬',
#     dog_gender: 'オス',
#     dog_age: Faker::Number.within(range: 1..18) ,
#     dog_weight: "#{rand(2..7)}kg" ,
#     dog_coat_color: '茶白' ,
#     dog_image_id: "./spec/fixtures/cat.jpeg",
#     dog_contraceptive_castrated: '済',
#     dog_microchip: '済' ,
#     dog_vaccination: '済',
#     dog_one_thing: 'とても人懐こくていい子です。トイレもばっちりできます!' ,
#     dog_health: '良好' ,
#     dog_personality: '人懐こい' ,
#     dog_history_of_protection: '飼い主の引っ越しにより飼えなくなった' ,
#     dog_remarks: '可能であれば2匹一緒に引き取りをご検討ください。' ,
#     dog_center_information: 'のび動物病院
#                 〒100-1000 東京都
#                 http://www.center.jp/' 
#   )
# end

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