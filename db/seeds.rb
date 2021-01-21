# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([= name: 'Star Wars' , = name: 'Lord of the Rings' ])
#   Character.create(name: 'Luke', movie: movies.first)

# Users
10.times do |n|
  name = Gimei.kanji 
  furigana_name = Gimei.hiragana
  email = Faker::Internet.email 
  password = 'password' 
  password_confirmation = 'password' 
  age = Faker::Number.within(range: 18..64)
  gender = "男"
  street_address = Gimei.address
  tel = "09012345678"
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

# Centers
10.times do |n|
  name = Gimei.kanji 
  furigana_name = Gimei.hiragana
  email = Faker::Internet.email 
  password = 'password' 
  password_confirmation = 'password' 
  director_name = '動物保護センター'
  staff_name = Gimei.kanji
  street_address = Gimei.address
  tel = "09012345678"
  Center.create!(
    name: name,
    furigana_name: furigana_name,
    email: email,
    password: password,
    password_confirmation: password_confirmation,
    director_name: director_name,
    staff_name: staff_name,
    street_address: street_address,
    tel: tel,
    approval: true,
    release: true,
    listok: true
    )
end

# Fosters
10.times do |n|
  name = Gimei.kanji 
  furigana_name = Gimei.hiragana
  email = Faker::Internet.email 
  password = 'password' 
  password_confirmation = 'password' 
  age = Faker::Number.within(range: 15..68)
  gender = "男" 
  street_address = Gimei.address
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
    street_address: street_address,
    tel: tel,
    tel_time: tel_time,
    animal_type: animal_type,
    animal_gender: animal_gender,
    animal_age: animal_age,
    animal_image: animal_image,
    reason: reason
    )
end

center = Center.first
10.times do
  center.cats.create!(
    cat_name: 'tony',
    cat_type: '雑種',
    cat_gender: 'オス',
    cat_age: Faker::Number.within(range: 1..18) ,
    cat_weight: "#{rand(2..5)}kg" ,
    cat_coat_color: 'キジ' ,
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