require 'rails_helper'

RSpec.describe "Centers", type: :system do
  
  let(:center) { FactoryBot.create(:center) }
  let(:another_center) { FactoryBot.create(:center) }

  describe 'Centers関連ページ' do
    
    context 'Center一覧ページ' do
      it 'Center一覧ページへ遷移する' do
        login(center)
        visit centers_path
        expect(current_path).to eq(centers_path)
      end
      
      it 'ログインなしでも一覧ページに遷移' do
        visit centers_path
        expect(current_path).to eq(centers_path)
      end
    end
    
    context 'Center詳細ページ' do
      it 'Center詳細ページへ遷移する' do
        login(center)
        visit center_path(center)
        expect(current_path).to eq(center_path(center))
      end
      
      it 'ログインなしでも詳細ページに遷移' do
        visit center_path(center)
        expect(current_path).to eq(center_path(center))
      end
    end

    context 'Center編集ページ' do
      it 'Center編集ページへ遷移する' do
        login(center)
        visit edit_center_registration_path
        expect(current_path).to eq(edit_center_registration_path)
      end
      
      it 'Center情報編集に成功する' do
        login(center)
        visit edit_center_registration_path
        fill_in 'center[email]', with: Faker::Internet.email
        fill_in 'center[name]', with: '動物保護センター'
        fill_in 'center[furigana_name]', with: 'どうぶつほごせんたー'
        fill_in 'center[director_name]', with: Gimei.kanji
        fill_in 'center[staff_name]', with: Gimei.kanji
        fill_in 'center[postcode]', with: '1001000'
        select '東京都', from: 'center[prefecture_code]'
        fill_in 'center[address_city]', with: '市区町村'
        fill_in 'center[address_street]', with: '番地'
        fill_in 'center[address_building]', with: '建物'
        fill_in 'center[tel]', with: "08012345678"
        fill_in 'center[care_time]', with: '午前9：00〜12：00、午後14：00〜17：00'
        fill_in 'center[close_date]', with: '水、日、祝日'
        fill_in 'center[acces]', with: '〇〇駅から徒歩5分'
        fill_in 'center[url]', with: 'https://www.example.jp'
        fill_in 'center[director_word]', with: ''
        click_on 'プロフィール更新'
        expect(page).to have_content 'アカウント情報を変更しました。'
        expect(current_path).to eq(center_path(center))
      end
      it 'メールアドレスを空白にするとCenter情報編集に失敗する' do
        login(center)
        visit edit_center_registration_path
        fill_in 'center[email]', with: ''
        fill_in 'center[name]', with: '動物保護センター'
        fill_in 'center[furigana_name]', with: 'どうぶつほごせんたー'
        fill_in 'center[director_name]', with: Gimei.kanji
        fill_in 'center[staff_name]', with: Gimei.kanji
        fill_in 'center[postcode]', with: '1001000'
        select '東京都', from: 'center[prefecture_code]'
        fill_in 'center[address_city]', with: '市区町村'
        fill_in 'center[address_street]', with: '番地'
        fill_in 'center[address_building]', with: '建物'
        fill_in 'center[tel]', with: "08012345678"
        fill_in 'center[care_time]', with: '午前9：00〜12：00、午後14：00〜17：00'
        fill_in 'center[close_date]', with: '水、日、祝日'
        fill_in 'center[acces]', with: '〇〇駅から徒歩5分'
        fill_in 'center[url]', with: 'https://www.example.jp'
        fill_in 'center[director_word]', with: ''
        click_on 'プロフィール更新'
        expect(page).to have_content 'メールアドレスを入力してください'
        expect(page).to have_content '件のエラーが発生したため 動物保護施設 は保存されませんでした:'
      end
    end
  end
  
end
