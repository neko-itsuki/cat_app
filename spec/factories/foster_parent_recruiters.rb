FactoryBot.define do
  factory :foster_parent_recruiter do
    name { Gimei.kanji }
    furigana_name { Gimei.hiragana }
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
    age { Faker::Number.within(range: 18..99) }
    gender { '男' or '女' }
    postcode { '1001000' }
    prefecture_code { '東京都' }
    address_city { '市区町村' }
    address_street { '番地' }
    address_building { '建物' }
    tel { "0#{rand(7..9)}0#{rand(1_000_000..99_999_999)}" }
    tel_time { rand(1..5) }
    animal_type { '雑種' }
    animal_gender { rand(1..5) }
    animal_age { rand(0..20) }
    animal_image { "app/assets/images/pickup_logo.gif" }
    reason { "子供が産まれた、家族にアレルギーが発症した" }
  end
end
