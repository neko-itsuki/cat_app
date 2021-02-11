require 'rails_helper'

RSpec.describe "CenterDog", type: :system do
  
  let(:center) { FactoryBot.create(:center) }
  let(:dog) { FactoryBot.create(:dog, center_id: center.id) }
  let(:another_center) { FactoryBot.create(:center) }

  describe "Center → Dog関連ページ" do
    
    context "Dog投稿ページ" do
      it "投稿する" do
        login(center)
        visit new_dog_path
        fill_in 'dog[dog_name]', with: Faker::Creature::Dog.name
        fill_in 'dog[dog_type]', with: '日本猫'
        fill_in 'dog[dog_gender]', with: 'オス'
        fill_in 'dog[dog_age]', with: Faker::Number.within(range: 1..18)
        fill_in 'dog[dog_weight]', with: "#{rand(2..5)}kg"
        fill_in 'dog[dog_coat_color]', with: 'キジ'
        attach_file 'dog[dog_image]', "app/assets/images/pickup_logo.gif"
        within '.dog_contraceptive_castrated' do choose '済' end
        within '.dog_microchip' do choose '済' end
        within '.dog_vaccination' do choose '済' end
        fill_in 'dog[dog_one_thing]', with: 'とても人懐こくていい子です。トイレもばっちりできます!'
        fill_in 'dog[dog_health]', with: '良好'
        fill_in 'dog[dog_personality]', with: '人懐こい'
        fill_in 'dog[dog_history_of_protection]', with: '飼い主の引っ越しにより飼えなくなった'
        fill_in 'dog[dog_remarks]', with: '可能であれば2匹一緒に引き取りをご検討ください'
        fill_in 'dog[dog_center_information]', with: 'のび動物病院
                        〒100-1000 東京都
                        http://www.center.jp/'
        click_on '新規投稿'
        expect(page).to have_content 'の投稿を作成しました'
      end
      
      it "名前が空白なので投稿に失敗する" do
        login(center)
        visit new_dog_path
        fill_in 'dog[dog_name]', with: ""
        fill_in 'dog[dog_type]', with: '日本猫'
        fill_in 'dog[dog_gender]', with: 'オス'
        fill_in 'dog[dog_age]', with: Faker::Number.within(range: 1..18)
        fill_in 'dog[dog_weight]', with: "#{rand(2..5)}kg"
        fill_in 'dog[dog_coat_color]', with: 'キジ'
        within '.dog_contraceptive_castrated' do choose '済' end
        within '.dog_microchip' do choose '済' end
        within '.dog_vaccination' do choose '済' end
        fill_in 'dog[dog_one_thing]', with: 'とても人懐こくていい子です。トイレもばっちりできます!'
        fill_in 'dog[dog_health]', with: '良好'
        fill_in 'dog[dog_personality]', with: '人懐こい'
        fill_in 'dog[dog_history_of_protection]', with: '飼い主の引っ越しにより飼えなくなった'
        fill_in 'dog[dog_remarks]', with: '可能であれば2匹一緒に引き取りをご検討ください'
        fill_in 'dog[dog_center_information]', with: 'のび動物病院
                        〒100-1000 東京都
                        http://www.center.jp/'
        click_on '新規投稿'
        expect(page).to have_content '名前を入力してください'
        expect(page).to have_content '件のエラーが発生したため 保護猫 は保存されませんでした:'
      end
      
      it "centerログインしていないと投稿できない" do
        visit new_dog_path
        expect(current_path).to eq(new_center_session_path)
      end
      
    end
    
    context "Dog編集ページ" do
      
      it 'Dog編集ページへ遷移する' do
        login(center)
        visit edit_dog_path(dog)
        expect(current_path).to eq(edit_dog_path(dog))
      end
      
      it "idが異なるからcurrent_centerの詳細ページへ遷移する" do
        login(another_center)
        visit edit_dog_path(dog)
        expect(current_path).to eq(center_path(another_center))
      end
      
      it 'Dog情報編集に成功する' do
        login(center)
        visit edit_dog_path(dog)
        fill_in 'dog[dog_name]', with: Faker::Creature::Dog.name
        fill_in 'dog[dog_type]', with: '日本猫'
        fill_in 'dog[dog_gender]', with: 'オス'
        fill_in 'dog[dog_age]', with: Faker::Number.within(range: 1..18)
        fill_in 'dog[dog_weight]', with: "#{rand(2..5)}kg"
        fill_in 'dog[dog_coat_color]', with: 'キジ'
        within '.dog_contraceptive_castrated' do choose '済' end
        within '.dog_microchip' do choose '済' end
        within '.dog_vaccination' do choose '済' end
        fill_in 'dog[dog_one_thing]', with: 'とても人懐こくていい子です。トイレもばっちりできます!'
        fill_in 'dog[dog_health]', with: '良好'
        fill_in 'dog[dog_personality]', with: '人懐こい'
        fill_in 'dog[dog_history_of_protection]', with: '飼い主の引っ越しにより飼えなくなった'
        fill_in 'dog[dog_remarks]', with: '可能であれば2匹一緒に引き取りをご検討ください'
        fill_in 'dog[dog_center_information]', with: 'のび動物病院
                        〒100-1000 東京都
                        http://www.center.jp/'
        click_on 'プロフィール更新'
        expect(page).to have_content 'のプロフィールを更新しました'
        expect(current_path).to eq(dog_path(dog))
      end
      it 'dog_nameを空白にするとDog情報編集に失敗する' do
        login(center)
        visit edit_dog_path(dog)
        fill_in 'dog[dog_name]', with: ''
        fill_in 'dog[dog_type]', with: '日本猫'
        fill_in 'dog[dog_gender]', with: 'オス'
        fill_in 'dog[dog_age]', with: Faker::Number.within(range: 1..18)
        fill_in 'dog[dog_weight]', with: "#{rand(2..5)}kg"
        fill_in 'dog[dog_coat_color]', with: 'キジ'
        within '.dog_contraceptive_castrated' do choose '済' end
        within '.dog_microchip' do choose '済' end
        within '.dog_vaccination' do choose '済' end
        fill_in 'dog[dog_one_thing]', with: 'とても人懐こくていい子です。トイレもばっちりできます!'
        fill_in 'dog[dog_health]', with: '良好'
        fill_in 'dog[dog_personality]', with: '人懐こい'
        fill_in 'dog[dog_history_of_protection]', with: '飼い主の引っ越しにより飼えなくなった'
        fill_in 'dog[dog_remarks]', with: '可能であれば2匹一緒に引き取りをご検討ください'
        fill_in 'dog[dog_center_information]', with: 'のび動物病院
                        〒100-1000 東京都
                        http://www.center.jp/'
        click_on 'プロフィール更新'
        expect(page).to have_content '名前を入力してください'
        expect(page).to have_content '件のエラーが発生したため 保護猫 は保存されませんでした:'
      end
      
    end
    
    context "Dog削除" do
      it "削除する" do
        login(center)
        dog
        expect{ delete dog_path(dog) }.to change(center.dogs,:count).by(-1)
      end
      
      it "idが異なるからcurrent_centerの詳細ページへ遷移する" do
        dog
        login(another_center)
        expect{ delete dog_path(dog) }.to change(center.dogs,:count).by(0)
        expect(delete dog_path(dog)).to redirect_to center_path(another_center)
      end
      
      it "centerログインしていないと削除できない" do
        dog
        expect(delete dog_path(dog)).to redirect_to new_center_session_path
      end
      
    end
    
  end
  
end
