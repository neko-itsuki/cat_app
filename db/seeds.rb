# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([= name: 'Star Wars' , = name: 'Lord of the Rings' ])
#   Character.create(name: 'Luke', movie: movies.first)

require 'aws-sdk-s3' 

# User
  # email = 'guest-user@example.com'
#   password = 'guest-user'
#   password_confirmation = 'guest-user' 
#   name = "ゲストユーザー"
#   furigana_name = "げすとゆーざー"
#   age = 25
#   gender = "男"
#   postcode = "1001000"
#   prefecture_code = '東京都'
#   address_city = '市区町村'
#   address_street = '番地'
#   address_building = '建物'
#   tel = "09012345678"
#   User.create!(
#     name: name,
#     furigana_name: furigana_name,
#     email: email,
#     password: password,
#     password_confirmation: password_confirmation,
#     age: age,
#     gender: gender,
#     postcode: postcode,
#     prefecture_code: prefecture_code,
#     address_city: address_city,
#     address_street: address_street,
#     address_building: address_building,
#     tel: tel,
#     pets_allowed: true,
#     living: true,
#     vaccination: true
#     )

# # Center
#   email = 'guest-center@example.com'
#   password = 'guest-center'
#   password_confirmation = 'guest-center' 
#   name = "ゲストセンター"
#   furigana_name = "げすとせんたー"
#   director_name = "ゲスト"
#   staff_name = "ゲスト"
#   postcode = "1001000"
#   prefecture_code = '東京都'
#   address_city = '市区町村'
#   address_street = '番地'
#   address_building = '建物'
#   tel = "09012345678"
#   Center.create!(
#     name: name,
#     furigana_name: furigana_name,
#     email: email,
#     password: password,
#     password_confirmation: password_confirmation,
#     director_name: director_name,
#     staff_name: staff_name,
#     postcode: postcode,
#     prefecture_code: prefecture_code,
#     address_city: address_city,
#     address_street: address_street,
#     address_building: address_building,
#     tel: tel,
#     approval: true,
#     release: true,
#     listok: true
#     )
    
# # Foster
#   email = 'guest-center@example.com'
#   password = 'guest-center'
#   password_confirmation = 'guest-center' 
#   name = "ゲストセンター"
#   furigana_name = "げすとせんたー"
#   age = 25
#   gender = "男"
#   postcode = "1001000"
#   prefecture_code = '東京都'
#   address_city = '市区町村'
#   address_street = '番地'
#   address_building = '建物'
#   tel = "09012345678"
#   tel_time = rand(1..5)
#   animal_type = '雑種'
#   animal_gender = "不明"
#   animal_age = rand(0..20)
#   animal_image = "app/assets/images/pickup_logo.gif"
#   reason = "子供が産まれた、家族にアレルギーが発症した"
#   FosterParentRecruiter.create!(
#     name: name,
#     furigana_name: furigana_name,
#     email: email,
#     password: password,
#     password_confirmation: password_confirmation,
#     age: age,
#     gender: gender,
#     postcode: postcode,
#     prefecture_code: prefecture_code,
#     address_city: address_city,
#     address_street: address_street,
#     address_building: address_building,
#     tel: tel,
#     tel_time: tel_time,
#     animal_type: animal_type,
#     animal_gender: animal_gender,
#     animal_age: animal_age,
#     animal_image: animal_image,
#     reason: reason
#     )

# # Centers
# 30.times do |n|
#   name = "保護センター#{rand(1..47)}" 
#   furigana_name = "ほごせんたー"
#   email = Faker::Internet.email 
#   password = 'password' 
#   password_confirmation = 'password' 
#   director_name = Gimei.kanji
#   staff_name = Gimei.kanji
#   postcode = "1001000"
#   prefecture_code = rand(1..47)
#   address_city = '市区町村'
#   address_street = '番地'
#   address_building = '建物'
#   tel = "09012345678"
#   Center.create!(
#     name: name,
#     furigana_name: furigana_name,
#     email: email,
#     password: password,
#     password_confirmation: password_confirmation,
#     director_name: director_name,
#     staff_name: staff_name,
#     postcode: postcode,
#     prefecture_code: prefecture_code,
#     address_city: address_city,
#     address_street: address_street,
#     address_building: address_building,
#     tel: tel,
#     approval: true,
#     release: true,
#     listok: true
#     )
# end

center = Center.first
s3 = Aws::S3::Resource.new(region: 'ap-northeast-1')
20.times do |i|
  # center = Center.find(Center.pluck(:id).sample)
  # Create the object to retrieve
    obj = s3.bucket('cat-app-refile').object("#{i}.jpeg")    # change this to your bucket name

    # Get the item's content and save it to local
    obj.get(response_target: "./spec/fixtures/cats/#{i}.jpeg")

    # center.cats.cat_image.attach(io: File.open("./spec/fixtures/cats/#{i}.jpeg"), filename: "#{i}.jpg")

    center.cats.create!(
      cat_name: Faker::Creature::Cat.name,
      cat_type: '雑種',
      cat_gender: 'オス',
      cat_age: Faker::Number.within(range: 1..18) ,
      cat_weight: "#{rand(2..5)}kg" ,
      cat_coat_color: 'キジ' ,
      cat_image: File.open("./spec/fixtures/cats/#{i}.jpeg"),
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
                  http://www.center.jp/')
  
end

center = Center.first
s3 = Aws::S3::Resource.new(region: 'ap-northeast-1')
20.times do |i|
  # center = Center.find(Center.pluck(:id).sample)
  # Create the object to retrieve
    obj = s3.bucket('cat-app-refile').object("#{i}.jpeg")    # change this to your bucket name

    # Get the item's content and save it to local
    obj.get(response_target: "./spec/fixtures/dogs/#{i}.jpeg")

    # center.dogs.dog_image.attach(io: File.open("./spec/fixtures/dogs/#{i}.jpeg"), filename: "#{i}.jpg")
    
    center.cats.create!(
      dog_name: Faker::Creature::Dog.name,
      dog_type: '柴犬',
      dog_gender: 'オス',
      dog_age: Faker::Number.within(range: 1..18) ,
      dog_weight: "#{rand(2..7)}kg" ,
      dog_coat_color: '茶白' ,
      dog_image: File.open("./spec/fixtures/dogs/#{i}.jpeg"),
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
                  http://www.center.jp/')
  
end

# center = Center.first
# 20.times do
#   center.cats.create!(
#     cat_name: Faker::Creature::Cat.name,
#     cat_type: '雑種',
#     cat_gender: 'オス',
#     cat_age: Faker::Number.within(range: 1..18) ,
#     cat_weight: "#{rand(2..5)}kg" ,
#     cat_coat_color: 'キジ' ,
#     cat_image: open("./spec/fixtures/cat.jpeg"),
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
# 20.times do
#   center.dogs.create!(
#     dog_name: Faker::Creature::Dog.name,
#     dog_type: '柴犬',
#     dog_gender: 'オス',
#     dog_age: Faker::Number.within(range: 1..18) ,
#     dog_weight: "#{rand(2..7)}kg" ,
#     dog_coat_color: '茶白' ,
#     dog_image: open("./spec/fixtures/dog.jpeg"),
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
