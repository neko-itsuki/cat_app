require 'rails_helper'

RSpec.describe "Users", type: :system do
  
  let(:user) { FactoryBot.create(:user) }
  let(:another_user) { FactoryBot.create(:user) }

  describe 'Users関連ページ' do
    context 'User詳細ページ' do
      it 'User詳細ページへ遷移する' do
        login(user)
        visit user_path(user)
        expect(current_path).to eq(user_path(user))
      end
      it 'idが異なるからcurrent_userの詳細ページへ遷移する' do
        login(user)
        visit user_path(another_user)
        expect(current_path).to eq(user_path(user))
      end
      it 'ログインなしで詳細ページに遷移しない' do
        visit user_path(user)
        expect(current_path).to eq(new_user_session_path)
      end
    end

    context 'User編集ページ' do
      it 'User編集ページへ遷移する' do
        login(user)
        visit edit_user_registration_path
        expect(current_path).to eq(edit_user_registration_path)
      end
      
      it 'User情報編集に成功する' do
        login(user)
        visit edit_user_registration_path
        fill_in 'user[email]', with: Faker::Internet.email
        fill_in 'user[name]', with: Gimei.kanji
        fill_in 'user[furigana_name]', with: Gimei.hiragana
        fill_in 'user[age]', with: Faker::Number.within(range: 18..64)
        # fill_in 'user[street_address]', 
        fill_in 'user[tel]', with: "08012345678"
        click_on 'プロフィール更新'
        expect(page).to have_content 'アカウント情報を変更しました。'
        expect(current_path).to eq(user_path(user))
      end
      it 'メールアドレスを空白にするとUser情報編集に失敗する' do
        login(user)
        visit edit_user_registration_path
        fill_in 'user[email]', with: ''
        fill_in 'user[name]', with: Gimei.kanji
        fill_in 'user[furigana_name]', with: Gimei.hiragana
        fill_in 'user[age]', with: Faker::Number.within(range: 18..64)
        # fill_in 'user[street_address]', 
        fill_in 'user[tel]', with: "08012345678"
        click_on 'プロフィール更新'
        expect(page).to have_content 'メールアドレスを入力してください'
        expect(page).to have_content '件のエラーが発生したため 里親希望者 は保存されませんでした:'
      end
    end
  end
  
end
