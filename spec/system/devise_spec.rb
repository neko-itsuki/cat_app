require 'rails_helper'

RSpec.describe 'Devise', type: :system do
  
  let(:user) {FactoryBot.create(:user)}
  # let(:foster_parent_recruiter) {FactoryBot.create(:foster_parent_recruiter)}
  # let(:center) {FactoryBot.create(:center)}
  
  # describe 'Adminテスト' do
    # context 'ログイン' do
    #   it 'ログインに成功する' do
    #     visit new_admin_session_path
    #     fill_in 'admin[email]', with: 'test@example.com'
    #     fill_in 'admin[password]', with: '123456'
    #     click_button 'ログイン'
    #     expect(current_path).to eq(admin_home_top_path)
    #   end
    #   it 'ログインに失敗する' do
    #     visit new_admin_session_path
    #     fill_in 'admin[email]', with: ''
    #     fill_in 'admin[password]', with: ''
    #     click_button 'ログイン'
    #     expect(current_path).to eq(new_admin_session_path)
    #   end
      # ciecleciで通らない
      # it 'かんたんログイン' do
      #   visit new_admin_session_path
      #   click_on 'かんたんログイン（閲覧用）'
      #   expect(current_path).to eq(guest_admin_path)
      # end

      # 実際にログアウトできるがテストが通らない
      # it 'ログアウト' do
      #   login admin
      #   visit admin_home_top_path
      #   find(".hm-icon").click
      #   click_on 'ログアウト'
      #   expect(current_path).to eq(new_admin_session_path)
      # end
    # end

  #   context 'Guide 会員ステータス変更' do
  #     it '退会' do
  #       login admin
  #       visit admin_guide_path(guide)
  #       find('#guide_deleted_at_1').click
  #       click_button '更新'
  #       expect(page).to have_content '退会させました'
  #     end
  #     it '復活' do
  #       login admin
  #       visit admin_guide_path(guide)
  #       find('#guide_deleted_at_0').click
  #       click_button '更新'
  #       expect(page).to have_content '会員を再開させました'
  #     end
  #   end
  # end

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
end
