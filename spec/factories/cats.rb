FactoryBot.define do
  factory :cat do
    association :center
    name { Faker::Creature::Cat.name }
    type { '日本猫' }
    gender { 'オス' or 'メス' }
    age { Faker::Number.within(range: 1..18) }
    weight { "#{rand(2..5)}kg" }
    coat_color { 'キジ' }
    contraceptive_castrated { '済' or '無' }
    microchip { '済' or '無' }
    vaccination { '済' or '無' }
    one_thing { 'とても人懐こくていい子です。トイレもばっちりできます!' }
    health { '良好' }
    personality { '人懐こい' }
    history_of_protection { '飼い主の引っ越しにより飼えなくなった' }
    remarks { '可能であれば2匹一緒に引き取りをご検討ください。' }
    center_information { 'のび動物病院
                〒100-1000 東京都
                http://www.center.jp/' }
    end
end
