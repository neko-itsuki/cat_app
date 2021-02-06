FactoryBot.define do
  factory :center do
    name { '動物保護センター' }
    furigana_name { 'どうぶつほごせんたー' }
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
    director_name { Gimei.kanji }
    staff_name { Gimei.kanji }
    postcode { '1001000' }
    prefecture_code { '東京都' }
    address_city { '市区町村' }
    address_street { '番地' }
    address_building { '建物' }
    tel { "0#{rand(7..9)}0#{rand(1_000_000..99_999_999)}" }
    care_time { '午前9：00〜12：00、午後14：00〜17：00' }
    close_date { '水、日、祝日' }
    acces { '〇〇駅から徒歩5分' }
    url { 'https://www.example.jp' }
    director_word { '一言' }
    approval { true }
    release { true }
    listok { true }
  end
end
