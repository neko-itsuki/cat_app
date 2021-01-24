require 'rails_helper'

RSpec.describe "FosterParentRecruiters", type: :system do
  
  let(:foster_parent_recruiter) { FactoryBot.create(:foster_parent_recruiter) }
  let(:another_foster_parent_recruiter) { FactoryBot.create(:foster_parent_recruiter) }

  describe 'FosterParentRecruiter関連ページ' do
    context 'FosterParentRecruiter詳細ページ' do
      it 'FosterParentRecruiter詳細ページへ遷移する' do
        login foster_parent_recruiter
        visit foster_parent_recruiter_path(foster_parent_recruiter)
        expect(current_path).to eq(foster_parent_recruiter_path(foster_parent_recruiter))
      end
      it 'idが異なるからcurrent_guideの詳細ページへ遷移する' do
        login foster_parent_recruiter
        visit foster_parent_recruiter_path(another_foster_parent_recruiter)
        expect(current_path).to eq(foster_parent_recruiter_path(foster_parent_recruiter))
      end
      it 'ログインなしで詳細ページに遷移しない' do
        visit foster_parent_recruiter_path(foster_parent_recruiter)
        expect(current_path).to eq(new_foster_parent_recruiter_session_path)
      end
    end

    context 'FosterParentRecruiter編集ページ' do
      it 'FosterParentRecruiter編集ページへ遷移する' do
        login foster_parent_recruiter
        visit edit_foster_parent_recruiter_registration_path(foster_parent_recruiter)
        expect(current_path).to eq(edit_foster_parent_recruiter_registration_path(foster_parent_recruiter))
      end
      
      it 'FosterParentRecruiter情報編集に成功する' do
        login foster_parent_recruiter
        visit edit_foster_parent_recruiter_registration_path(foster_parent_recruiter)
        fill_in 'foster_parent_recruiter[email]', with: Faker::Internet.email
        fill_in 'foster_parent_recruiter[name]', with: "佐藤希望"
        fill_in 'foster_parent_recruiter[furigana_name]', with: Gimei.hiragana
        fill_in 'foster_parent_recruiter[age]', with: Faker::Number.within(range: 18..64)
        # fill_in 'foster_parent_recruiter[street_address]', 
        fill_in 'foster_parent_recruiter[tel]', with: "08012345678"
        select '10:00〜12:00' or '12:00〜14:00' or '14:00〜16:00' or '16:00〜18:00' or '18:00〜20:00'
        # 犬・猫について
        fill_in 'foster_parent_recruiter[animal_type]', with: "雑種"
        choose '不明' or '男の子' or '女の子' or '男の子(去勢済)' or '女の子(避妊済)'
        fill_in 'foster_parent_recruiter[animal_age]', with: "5"
        attach_file 'foster_parent_recruiter[animal_image]', "app/assets/images/pickup_logo.gif"
        fill_in 'foster_parent_recruiter[reason]', with: "子供が産まれた、家族にアレルギーが発症した"
        click_on 'プロフィール更新'
        expect(page).to have_content 'アカウント情報を変更しました。'
        expect(current_path).to eq(foster_parent_recruiter_path(foster_parent_recruiter))
      end
      it 'メールアドレスを空白にするとFosterParentRecruiter情報編集に失敗する' do
        login foster_parent_recruiter
        visit edit_foster_parent_recruiter_registration_path(foster_parent_recruiter)
        fill_in 'foster_parent_recruiter[email]', with: ''
        fill_in 'foster_parent_recruiter[name]', with: Gimei.kanji
        fill_in 'foster_parent_recruiter[furigana_name]', with: Gimei.hiragana
        fill_in 'foster_parent_recruiter[age]', with: Faker::Number.within(range: 18..64)
        # fill_in 'foster_parent_recruiter[street_address]', 
        fill_in 'foster_parent_recruiter[tel]', with: "08012345678"
        select '10:00〜12:00' or '12:00〜14:00' or '14:00〜16:00' or '16:00〜18:00' or '18:00〜20:00'
        # 犬・猫について
        fill_in 'foster_parent_recruiter[animal_type]', with: "雑種"
        choose '不明' or '男の子' or '女の子' or '男の子(去勢済)' or '女の子(避妊済)'
        fill_in 'foster_parent_recruiter[animal_age]', with: "5"
        attach_file 'foster_parent_recruiter[animal_image]', "app/assets/images/pickup_logo.gif"
        fill_in 'foster_parent_recruiter[reason]', with: "子供が産まれた、家族にアレルギーが発症した"
        click_on 'プロフィール更新'
        expect(page).to have_content 'メールアドレスを入力してください'
        expect(page).to have_content '件のエラーが発生したため 里親募集者 は保存されませんでした:'
      end
    end
  end
  
end
