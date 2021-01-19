FactoryBot.define do
  factory :center do
    name { Gimei.kanji }
    furigana_name { Gimei.hiragana }
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
    director_name { '動物保護センター' }
    staff_name { Gimei.kanji }
    street_address { Gimei.address }
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
