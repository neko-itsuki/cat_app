FactoryBot.define do
  factory :cat do
    association :center
    cat_name { Faker::Creature::Cat.name }
    cat_type { '日本猫' }
    cat_gender { 'オス' or 'メス' }
    cat_age { Faker::Number.within(range: 1..18) }
    cat_weight { "#{rand(2..5)}kg" }
    cat_coat_color { 'キジ' }
    cat_image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/cats/1.jpeg')) }
    cat_contraceptive_castrated { '済' or '無' }
    cat_microchip { '済' or '無' }
    cat_vaccination { '済' or '無' }
    cat_one_thing { 'とても人懐こくていい子です。トイレもばっちりできます!' }
    cat_health { '良好' }
    cat_personality { '人懐こい' }
    cat_history_of_protection { '飼い主の引っ越しにより飼えなくなった' }
    cat_remarks { '可能であれば2匹一緒に引き取りをご検討ください。' }
    end
end
