FactoryBot.define do
  factory :user do
    name { Gimei.kanji }
    furigana_name { Gimei.hiragana }
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
    age { Faker::Number.within(range: 18..64) }
    gender { '男' or '女' }
    postcode { '1001000' }
    prefecture_code { '東京都' }
    address_city { '市区町村' }
    address_street { '番地' }
    address_building { '建物' }
    tel { "0#{rand(7..9)}0#{rand(1_000_000..99_999_999)}" }
    pets_allowed { true }
    living { true }
    vaccination { true }
  end
end