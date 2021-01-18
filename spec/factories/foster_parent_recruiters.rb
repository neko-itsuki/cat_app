FactoryBot.define do
  factory :foster_parent_recruiter do
    name { Gimei.kanji }
    furigana_name { Gimei.hiragana }
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
    age { Faker::Number.within(range: 18..100) }
    gender { '男' or '女' }
    street_address { Gimei.address }
    tel { "0#{rand(7..9)}0#{rand(1_000_000..99_999_999)}" }
    tel_time { rand(1..5) }
    animal_type { '雑種' }
    animal_gender { rand(1..5) }
    animal_age { rand(0..20) }
    animal_image { "app/assets/images/pickup_logo.gif" }
    reason { "子供が産まれた、家族にアレルギーが発症した" }
  end
end
