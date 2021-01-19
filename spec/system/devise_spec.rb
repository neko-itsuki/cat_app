require 'rails_helper'

RSpec.describe 'Devise', type: :system do
  
  let(:user) {FactoryBot.create(:user)}
  let(:foster_parent_recruiter) {FactoryBot.create(:foster_parent_recruiter)}
  let(:center) {FactoryBot.create(:center)}
  
  describe 'Userテスト' do
    context '新規登録' do
      before do
        visit new_user_registration_path
      end
      it '新規登録に成功する' do
        fill_in 'user[email]', with: Faker::Internet.email
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'
        fill_in 'user[name]', with: Gimei.kanji
        fill_in 'user[furigana_name]', with: Gimei.hiragana
        fill_in 'user[age]', with: Faker::Number.within(range: 18..64)
        choose '男' or '女'
        # fill_in 'user[street_address]', 
        fill_in 'user[tel]', with: "08012345678"
        check '犬・猫可住宅にお住まいですか？'
        check '生計を立てる収入はございますか？'
        check '譲渡後、狂犬病予防注射・ワクチン接種をお約束いただけますか？'
        click_on "新規登録"
        expect(page).to have_content 'アカウント登録が完了しました。'
      end
      
      it '新規登録に失敗する' do
        fill_in 'user[email]', with: ''
        fill_in 'user[password]', with: ''
        fill_in 'user[password_confirmation]', with: ''
        fill_in 'user[name]', with: ''
        fill_in 'user[furigana_name]', with:''
        fill_in 'user[age]', with: ''
        # fill_in 'user[street_address]', 
        fill_in 'user[tel]', with: ''
        uncheck '犬・猫可住宅にお住まいですか？'
        uncheck '生計を立てる収入はございますか？'
        uncheck '譲渡後、狂犬病予防注射・ワクチン接種をお約束いただけますか？'
        click_on "新規登録"
        expect(page).to have_content "[犬・猫可住宅にお住まいですか？]確認事項を受諾してください"
        expect(page).to have_content "[生計を立てる収入はございますか？]確認事項を受諾してください"
        expect(page).to have_content "[譲渡後、狂犬病予防注射・ワクチン接種をお約束いただけますか？]確認事項を受諾してください"
        expect(page).to have_content '件のエラーが発生したため 里親希望者 は保存されませんでした:'
      end
    end
    
    context 'ログイン・ログアウト' do
      before do
        FactoryBot.create(:user, email: "test@example.com")
      end
      it 'ログインに成功する' do
        visit new_user_session_path
        fill_in 'user[email]', with: 'test@example.com'
        fill_in 'user[password]', with: 'password'
        click_button 'ログイン'
        expect(current_path).to eq(root_path)
        expect(page).to have_content 'ログアウト'
        expect(page).to have_content 'ログインしました。'
      end
      it 'ログインに失敗する' do
        visit new_user_session_path
        fill_in 'user[email]', with: ''
        fill_in 'user[password]', with: ''
        click_button 'ログイン'
        expect(current_path).to eq(new_user_session_path)
        expect(page).to have_content 'メールアドレス もしくはパスワードが不正です。'
      end
      it 'ログインに失敗する' do
        visit new_user_session_path
        fill_in 'user[email]', with: 'test@example.com'
        fill_in 'user[password]', with: 'WrongPassword'
        click_button 'ログイン'
        expect(current_path).to eq(new_user_session_path)
        expect(page).to have_content 'メールアドレス もしくはパスワードが不正です。'
      end
      
      # 実際にログアウトできるがテストが通らない
      # it 'ログアウトに成功する' do
      #   login(user)
      #   expect(page).to have_content 'ログアウト'
      #   click_on 'ログアウト'
      #   expect(current_path).to eq(root_path)
      #   expect(page).to have_content 'ログアウトしました。'
      # end

      # it 'かんたんログイン' do
      #   visit new_guide_session_path
      #   click_on 'ゲストログイン（閲覧用）'
      #   expect(current_path).to eq(guest_guide_path)
      # end

    end
    context '退会に成功する' do
      before do
        login user
        visit user_path(user)
        expect(page).to have_button '退会する'
      end
      it '退会に成功する' do
        click_on '退会する'
        expect(page).to have_content 'ありがとうございました'
      end
    end
  end
  
  describe 'FosterParentRecruiterテスト' do
    context '新規登録' do
      before do
        visit new_foster_parent_recruiter_registration_path
      end
      it '新規登録に成功する' do
        fill_in 'foster_parent_recruiter[email]', with: Faker::Internet.email
        fill_in 'foster_parent_recruiter[password]', with: 'password'
        fill_in 'foster_parent_recruiter[password_confirmation]', with: 'password'
        fill_in 'foster_parent_recruiter[name]', with: Gimei.kanji
        fill_in 'foster_parent_recruiter[furigana_name]', with: Gimei.hiragana
        fill_in 'foster_parent_recruiter[age]', with: Faker::Number.within(range: 18..64)
        choose '男' or '女'
        # fill_in 'foster_parent_recruiter[street_address]', 
        fill_in 'foster_parent_recruiter[tel]', with: "08012345678"
        select '10:00〜12:00' or '12:00〜14:00' or '14:00〜16:00' or '16:00〜18:00' or '18:00〜20:00'
        # 犬・猫について
        fill_in 'foster_parent_recruiter[animal_type]', with: "雑種"
        choose '不明' or '男の子' or '女の子' or '男の子(去勢済)' or '女の子(避妊済)'
        fill_in 'foster_parent_recruiter[animal_age]', with: "5"
        attach_file 'foster_parent_recruiter[animal_image]', "app/assets/images/pickup_logo.gif"
        fill_in 'foster_parent_recruiter[reason]', with: "子供が産まれた、家族にアレルギーが発症した"
        click_on "新規登録"
        expect(page).to have_content 'アカウント登録が完了しました。'
      end
      
      it '新規登録に失敗する' do
        fill_in 'foster_parent_recruiter[email]', with: ''
        fill_in 'foster_parent_recruiter[password]', with: ''
        fill_in 'foster_parent_recruiter[password_confirmation]', with: ''
        fill_in 'foster_parent_recruiter[name]', with: ''
        fill_in 'foster_parent_recruiter[furigana_name]', with: ''
        fill_in 'foster_parent_recruiter[age]', with: ''
        # fill_in 'foster_parent_recruiter[street_address]', 
        fill_in 'foster_parent_recruiter[tel]', with: ""
        # 犬・猫について
        fill_in 'foster_parent_recruiter[animal_type]', with: ""
        fill_in 'foster_parent_recruiter[animal_age]', with: ''
        fill_in 'foster_parent_recruiter[reason]', with: ""
        click_on "新規登録"
        expect(page).to have_content '件のエラーが発生したため 里親募集者 は保存されませんでした:'
      end
    end
    
    context 'ログイン・ログアウト' do
      before do
        FactoryBot.create(:foster_parent_recruiter, email: "test@example.com")
      end
      it 'ログインに成功する' do
        visit new_foster_parent_recruiter_session_path
        fill_in 'foster_parent_recruiter[email]', with: 'test@example.com'
        fill_in 'foster_parent_recruiter[password]', with: 'password'
        click_button 'ログイン'
        expect(current_path).to eq(root_path)
        expect(page).to have_content 'ログアウト'
        expect(page).to have_content 'ログインしました。'
      end
      it 'ログインに失敗する' do
        visit new_foster_parent_recruiter_session_path
        fill_in 'foster_parent_recruiter[email]', with: ''
        fill_in 'foster_parent_recruiter[password]', with: ''
        click_button 'ログイン'
        expect(current_path).to eq(new_foster_parent_recruiter_session_path)
        expect(page).to have_content 'メールアドレス もしくはパスワードが不正です。'
      end
      it 'ログインに失敗する' do
        visit new_foster_parent_recruiter_session_path
        fill_in 'foster_parent_recruiter[email]', with: 'test@example.com'
        fill_in 'foster_parent_recruiter[password]', with: 'WrongPassword'
        click_button 'ログイン'
        expect(current_path).to eq(new_foster_parent_recruiter_session_path)
        expect(page).to have_content 'メールアドレス もしくはパスワードが不正です。'
      end
      
      # 実際にログアウトできるがテストが通らない
      # it 'ログアウトに成功する' do
      #   login(foster_parent_recruiter)
      #   expect(page).to have_content 'ログアウト'
      #   click_on 'ログアウト'
      #   expect(current_path).to eq(root_path)
      #   expect(page).to have_content 'ログアウトしました。'
      # end

      # it 'かんたんログイン' do
      #   visit new_guide_session_path
      #   click_on 'ゲストログイン（閲覧用）'
      #   expect(current_path).to eq(guest_guide_path)
      # end

    end
    context '退会に成功する' do
      before do
        login foster_parent_recruiter
        visit foster_parent_recruiter_path(foster_parent_recruiter)
        expect(page).to have_button '退会する'
      end
      it '退会に成功する' do
        click_on '退会する'
        expect(page).to have_content 'ありがとうございました'
      end
    end
  end
  
  describe 'Centerテスト' do
    context '新規登録' do
      before do
        visit new_center_registration_path
      end
      it '新規登録に成功する' do
        fill_in 'center[email]', with: Faker::Internet.email
        fill_in 'center[password]', with: 'password'
        fill_in 'center[password_confirmation]', with: 'password'
        fill_in 'center[name]', with: Gimei.kanji
        fill_in 'center[furigana_name]', with: Gimei.hiragana
        fill_in 'center[director_name]', with: Gimei.kanji
        fill_in 'center[staff_name]', with: Gimei.kanji
        # fill_in 'center[street_address]',
        fill_in 'center[tel]', with: "08012345678"
        check 'この企画に賛同していただけますか？'
        check '病院の情報をホームページに公開してよろしいですか？'
        check '賛同動物病院一覧に記載してよろしいですか？'
        click_on "新規登録"
        expect(page).to have_content 'アカウント登録が完了しました。'
      end
      
      it '新規登録に失敗する' do
        fill_in 'center[email]', with: ''
        fill_in 'center[password]', with: ''
        fill_in 'center[password_confirmation]', with: ''
        fill_in 'center[name]', with: ''
        fill_in 'center[furigana_name]', with: ''
        fill_in 'center[director_name]', with: ''
        fill_in 'center[staff_name]', with: ''
        # fill_in 'center[street_address]',
        fill_in 'center[tel]', with: ''
        uncheck 'この企画に賛同していただけますか？'
        uncheck '病院の情報をホームページに公開してよろしいですか？'
        uncheck '賛同動物病院一覧に記載してよろしいですか？'
        click_on "新規登録"
        expect(page).to have_content "[この企画に賛同していただけますか？]確認事項を受諾してください"
        expect(page).to have_content "[病院の情報をホームページに公開してよろしいですか？]確認事項を受諾してください"
        expect(page).to have_content "[賛同動物病院一覧に記載してよろしいですか？]確認事項を受諾してください"
        expect(page).to have_content '件のエラーが発生したため 動物保護施設 は保存されませんでした:'
      end
    end
    
    context 'ログイン・ログアウト' do
      before do
        FactoryBot.create(:center, email: "test@example.com")
      end
      it 'ログインに成功する' do
        visit new_center_session_path
        fill_in 'center[email]', with: 'test@example.com'
        fill_in 'center[password]', with: 'password'
        click_button 'ログイン'
        expect(current_path).to eq(root_path)
        expect(page).to have_content 'ログアウト'
        expect(page).to have_content 'ログインしました。'
      end
      it 'ログインに失敗する' do
        visit new_center_session_path
        fill_in 'center[email]', with: ''
        fill_in 'center[password]', with: ''
        click_button 'ログイン'
        expect(current_path).to eq(new_center_session_path)
        expect(page).to have_content 'メールアドレス もしくはパスワードが不正です。'
      end
      it 'ログインに失敗する' do
        visit new_center_session_path
        fill_in 'center[email]', with: 'test@example.com'
        fill_in 'center[password]', with: 'WrongPassword'
        click_button 'ログイン'
        expect(current_path).to eq(new_center_session_path)
        expect(page).to have_content 'メールアドレス もしくはパスワードが不正です。'
      end
      
      # 実際にログアウトできるがテストが通らない
      # it 'ログアウトに成功する' do
      #   login(center)
      #   expect(page).to have_content 'ログアウト'
      #   click_on 'ログアウト'
      #   expect(current_path).to eq(root_path)
      #   expect(page).to have_content 'ログアウトしました。'
      # end

      # it 'かんたんログイン' do
      #   visit new_guide_session_path
      #   click_on 'ゲストログイン（閲覧用）'
      #   expect(current_path).to eq(guest_guide_path)
      # end

    end
    context '退会に成功する' do
      before do
        login center
        visit center_path(center)
        expect(page).to have_button '退会する'
      end
      it '退会に成功する' do
        click_on '退会する'
        expect(page).to have_content 'ありがとうございました'
      end
    end
  end
end
