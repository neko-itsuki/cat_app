require 'rails_helper'

RSpec.describe "CenterCat", type: :system do
  
  let(:center) { FactoryBot.create(:center) }
  let(:cat) { FactoryBot.create(:cat, center_id: center.id) }
  let(:another_center) { FactoryBot.create(:center) }

  describe "Center → Cat関連ページ" do
    
    context "Cat投稿ページ" do
      it "投稿する" do
        login(center)
        visit new_cat_path
        fill_in 'cat[cat_name]', with: Faker::Creature::Cat.name
        fill_in 'cat[cat_type]', with: '日本猫'
        fill_in 'cat[cat_gender]', with: 'オス'
        fill_in 'cat[cat_age]', with: Faker::Number.within(range: 1..18)
        fill_in 'cat[cat_weight]', with: "#{rand(2..5)}kg"
        fill_in 'cat[cat_coat_color]', with: 'キジ'
        within '.cat_contraceptive_castrated' do choose '済' end
        within '.cat_microchip' do choose '済' end
        within '.cat_vaccination' do choose '済' end
        fill_in 'cat[cat_one_thing]', with: 'とても人懐こくていい子です。トイレもばっちりできます!'
        fill_in 'cat[cat_health]', with: '良好'
        fill_in 'cat[cat_personality]', with: '人懐こい'
        fill_in 'cat[cat_history_of_protection]', with: '飼い主の引っ越しにより飼えなくなった'
        fill_in 'cat[cat_remarks]', with: '可能であれば2匹一緒に引き取りをご検討ください'
        fill_in 'cat[cat_center_information]', with: 'のび動物病院
                        〒100-1000 東京都
                        http://www.center.jp/'
        click_on '新規投稿'
        expect(page).to have_content 'の投稿を作成しました'
      end
      
      it "名前が空白なので投稿に失敗する" do
        login(center)
        visit new_cat_path
        fill_in 'cat[cat_name]', with: ""
        fill_in 'cat[cat_type]', with: '日本猫'
        fill_in 'cat[cat_gender]', with: 'オス'
        fill_in 'cat[cat_age]', with: Faker::Number.within(range: 1..18)
        fill_in 'cat[cat_weight]', with: "#{rand(2..5)}kg"
        fill_in 'cat[cat_coat_color]', with: 'キジ'
        within '.cat_contraceptive_castrated' do choose '済' end
        within '.cat_microchip' do choose '済' end
        within '.cat_vaccination' do choose '済' end
        fill_in 'cat[cat_one_thing]', with: 'とても人懐こくていい子です。トイレもばっちりできます!'
        fill_in 'cat[cat_health]', with: '良好'
        fill_in 'cat[cat_personality]', with: '人懐こい'
        fill_in 'cat[cat_history_of_protection]', with: '飼い主の引っ越しにより飼えなくなった'
        fill_in 'cat[cat_remarks]', with: '可能であれば2匹一緒に引き取りをご検討ください'
        fill_in 'cat[cat_center_information]', with: 'のび動物病院
                        〒100-1000 東京都
                        http://www.center.jp/'
        click_on '新規投稿'
        expect(page).to have_content '名前を入力してください'
        expect(page).to have_content '件のエラーが発生したため 保護猫 は保存されませんでした:'
      end
      
      it "centerログインしていないと投稿できない" do
        visit new_cat_path
        expect(current_path).to eq(new_center_session_path)
      end
      
    end
    
    context "Cat編集ページ" do
      
      it 'Cat編集ページへ遷移する' do
        login(center)
        visit edit_cat_path(cat)
        expect(current_path).to eq(edit_cat_path(cat))
      end
      
      it "idが異なるからcurrent_centerの詳細ページへ遷移する" do
        login(another_center)
        visit edit_cat_path(cat)
        expect(current_path).to eq(center_path(another_center))
      end
      
      it 'Cat情報編集に成功する' do
        login(center)
        visit edit_cat_path(cat)
        fill_in 'cat[cat_name]', with: Faker::Creature::Cat.name
        fill_in 'cat[cat_type]', with: '日本猫'
        fill_in 'cat[cat_gender]', with: 'オス'
        fill_in 'cat[cat_age]', with: Faker::Number.within(range: 1..18)
        fill_in 'cat[cat_weight]', with: "#{rand(2..5)}kg"
        fill_in 'cat[cat_coat_color]', with: 'キジ'
        within '.cat_contraceptive_castrated' do choose '済' end
        within '.cat_microchip' do choose '済' end
        within '.cat_vaccination' do choose '済' end
        fill_in 'cat[cat_one_thing]', with: 'とても人懐こくていい子です。トイレもばっちりできます!'
        fill_in 'cat[cat_health]', with: '良好'
        fill_in 'cat[cat_personality]', with: '人懐こい'
        fill_in 'cat[cat_history_of_protection]', with: '飼い主の引っ越しにより飼えなくなった'
        fill_in 'cat[cat_remarks]', with: '可能であれば2匹一緒に引き取りをご検討ください'
        fill_in 'cat[cat_center_information]', with: 'のび動物病院
                        〒100-1000 東京都
                        http://www.center.jp/'
        click_on 'プロフィール更新'
        expect(page).to have_content 'のプロフィールを更新しました'
        expect(current_path).to eq(cat_path(cat))
      end
      it 'cat_nameを空白にするとCat情報編集に失敗する' do
        login(center)
        visit edit_cat_path(cat)
        fill_in 'cat[cat_name]', with: ''
        fill_in 'cat[cat_type]', with: '日本猫'
        fill_in 'cat[cat_gender]', with: 'オス'
        fill_in 'cat[cat_age]', with: Faker::Number.within(range: 1..18)
        fill_in 'cat[cat_weight]', with: "#{rand(2..5)}kg"
        fill_in 'cat[cat_coat_color]', with: 'キジ'
        within '.cat_contraceptive_castrated' do choose '済' end
        within '.cat_microchip' do choose '済' end
        within '.cat_vaccination' do choose '済' end
        fill_in 'cat[cat_one_thing]', with: 'とても人懐こくていい子です。トイレもばっちりできます!'
        fill_in 'cat[cat_health]', with: '良好'
        fill_in 'cat[cat_personality]', with: '人懐こい'
        fill_in 'cat[cat_history_of_protection]', with: '飼い主の引っ越しにより飼えなくなった'
        fill_in 'cat[cat_remarks]', with: '可能であれば2匹一緒に引き取りをご検討ください'
        fill_in 'cat[cat_center_information]', with: 'のび動物病院
                        〒100-1000 東京都
                        http://www.center.jp/'
        click_on 'プロフィール更新'
        expect(page).to have_content '名前を入力してください'
        expect(page).to have_content '件のエラーが発生したため 保護猫 は保存されませんでした:'
      end
      
    end
    
    context "Cat削除" do
      it "削除する" do
        login(center)
        cat
        expect{ delete cat_path(cat) }.to change(center.cats,:count).by(-1)
      end
      
      it "idが異なるからcurrent_centerの詳細ページへ遷移する" do
        cat
        login(another_center)
        expect{ delete cat_path(cat) }.to change(center.cats,:count).by(0)
        expect(delete cat_path(cat)).to redirect_to center_path(another_center)
      end
      
      it "centerログインしていないと削除できない" do
        cat
        expect(delete cat_path(cat)).to redirect_to new_center_session_path
      end
      
    end
    
  end
  
end
