FactoryBot.define do
  factory :dog do
    association :center
    dog_name { Faker::Creature::Dog.name }
    dog_type { 'シー・ズー' }
    dog_gender { 'オス' or 'メス' }
    dog_age { Faker::Number.within(range: 1..18) }
    dog_weight {"#{rand(2..7)}kg"  }
    dog_coat_color { 'ホワイト&ゴールド' }
    dog_contraceptive_castrated { '済' or '無' }
    dog_microchip { '済' or '無' }
    dog_vaccination { '済' or '無' }
    dog_one_thing { 'とても人懐こくていい子です。トイレもばっちりできます!' }
    dog_health { '良好' }
    dog_personality { '人懐こい' }
    dog_history_of_protection { '飼い主の引っ越しにより飼えなくなった' }
    dog_remarks { '可能であれば2匹一緒に引き取りをご検討ください' }
    dog_center_information { 'のび動物病院
                〒100-1000 東京都
                http://www.center.jp/' }
  end
end
