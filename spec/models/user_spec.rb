require 'rails_helper'

RSpec.describe User, type: :model do
  
  let(:user) {FactoryBot.create(:user)}
  
  describe "Userの保存のテスト" do
    it "Userの有効性" do
      expect(user).to be_valid
    end
  end
  
  describe "userのバリデーションテスト" do
    
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_length_of(:name).is_at_most(25) }
    
    it { is_expected.to validate_presence_of :furigana_name }
    it { is_expected.to validate_length_of(:furigana_name).is_at_most(50) }
    
    it { is_expected.to validate_presence_of :email}
    it { is_expected.to validate_length_of(:email).is_at_most(255) }
    
    it { is_expected.to validate_presence_of :password }
    it { is_expected.to validate_length_of(:password).is_at_least(6).is_at_most(128) }
    
    it { is_expected.to validate_numericality_of(:age).is_greater_than_or_equal_to(18).is_less_than(65) }
    
    VALID_TEL_REGEX = /\A0(\d{1}\d{4}|\d{2}\d{3}|\d{3}\d{2}|\d{4}\d{1})\d{4}\z|\A0[789]0\d{4}\d{4}\z/
    it { expect(user.tel).to match(VALID_TEL_REGEX) }
  
  end

  describe "メールアドレスの有効性" do
  
    it "無効なメールアドレスの場合" do
      invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. 
                            foo@bar_baz.com foo@bar+baz.com]
      invalid_addresses.each do |invalid_address|
        user.email = invalid_address
        expect(user).to_not be_valid
      end
    end
  
    it "有効なメールアドレスの場合" do
      valid_addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      valid_addresses.each do |valid_address|
        user.email = valid_address
        expect(user).to be_valid
      end
    end
    
    it "重複したメールアドレスなら無効" do 
      FactoryBot.create(:user, email: "aaron@example.com")
      user = FactoryBot.build(:user, email: "Aaron@example.com")
      user.invalid?
    end
    
  end

  describe "パスワード確認の一致" do
    
    it "一致する場合" do
      user = FactoryBot.build(:user, password: "password", password_confirmation: "password")
      expect(user).to be_valid
    end

    it "一致しない場合" do
      user = FactoryBot.build(:user, password: "password", password_confirmation: "different")
      user.invalid?
    end
  end
  
  # describe "電話番号の有効性" do
    
  #   context "有効な電話番号の場合" do
      
  #     it "0から始まり、10桁" do
  #       FactoryBot.create(:user, tel: "0#{rand(10_000_000..999_999_999)}")
  #       expect(user.tel).to be_valid
  #     end
      
  #     it "070、080、090で始まり、11桁" do
  #       FactoryBot.create(:user, tel: "0#{rand(7..9)}0#{rand(1_000_000..99_999_999)}")
  #       expect(user.tel).to be_valid
  #     end
      
  #   end
    
    # context "無効な電話番号の場合" do
      
    #   it "0から始まらない" do
        
    #   end
      
    #   it "070、080、090以外で始まる" do
        
    #   end
      
    #   it "9桁以下の時" do
        
    #   end
      
    #   it "12桁以上の時" do
        
    #   end
      
    # end
    
  # end
  
end
