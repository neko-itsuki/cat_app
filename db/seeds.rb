# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([= name: 'Star Wars' , = name: 'Lord of the Rings' ])
#   Character.create(name: 'Luke', movie: movies.first)

# 10.times do |n|
#   name = Gimei.kanji 
#   furigana_name = Gimei.hiragana
#   email = Faker::Internet.email 
#   password = 'password' 
#   password_confirmation = 'password' 
#   age = Faker::Number.within(range: 15..68)
#   gender = Faker::Boolean.boolean(true_ratio: 0.5) 
#   street_address = Gimei.address
#   tel = Faker::PhoneNumber.cell_phone
#   User.create!(
#     name: name,
#     furigana_name: furigana_name,
#     email: email,
#     password: password,
#     password_confirmation: password_confirmation,
#     age: age,
#     gender: gender,
#     street_address: street_address,
#     tel: tel,
#     pets_allowed: true,
#     living: true,
#     vaccination: true
#     )
# end

center = Center.first
10.times do
  center.cats.create!(
    name: 'tony',
    type: '雑種',
    gender: 'オス',
    age: Faker::Number.within(range: 1..18) ,
    weight: "#{rand(2..5)}kg" ,
    coat_color: 'キジ' ,
    contraceptive_castrated: '済',
    microchip: '済' ,
    vaccination: '済',
    one_thing: 'とても人懐こくていい子です。トイレもばっちりできます!' ,
    health: '良好' ,
    personality: '人懐こい' ,
    history_of_protection: '飼い主の引っ越しにより飼えなくなった' ,
    remarks: '可能であれば2匹一緒に引き取りをご検討ください。' ,
    center_information: 'のび動物病院
                〒100-1000 東京都
                http://www.center.jp/' 
  )
end