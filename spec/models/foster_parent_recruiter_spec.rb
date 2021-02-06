require 'rails_helper'

RSpec.describe FosterParentRecruiter, type: :model do
  let(:foster_parent_recruiter) {FactoryBot.create(:foster_parent_recruiter)}
  
  describe "FosterParentRecruiterの保存のテスト" do
    it "FosterParentRecruiterの有効性" do
      expect(foster_parent_recruiter).to be_valid
    end
  end
  
  describe "FosterParentRecruiterのバリデーションテスト" do
    
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_length_of(:name).is_at_most(25) }
    
    it { is_expected.to validate_presence_of :furigana_name }
    it { is_expected.to validate_length_of(:furigana_name).is_at_most(50) }
    
    it { is_expected.to validate_presence_of :email}
    it { is_expected.to validate_length_of(:email).is_at_most(255) }
    
    it { is_expected.to validate_presence_of :password }
    it { is_expected.to validate_length_of(:password).is_at_least(6).is_at_most(128) }
    
    it { is_expected.to validate_numericality_of(:age).is_greater_than_or_equal_to(18).is_less_than(100) }
    
    it { is_expected.to validate_presence_of :postcode }
    it { is_expected.to validate_presence_of :prefecture_code }
    it { is_expected.to validate_presence_of :address_city }
    it { is_expected.to validate_presence_of :address_street }
    
    VALID_RECRUITER_TEL_REGEX = /\A0(\d{1}\d{4}|\d{2}\d{3}|\d{3}\d{2}|\d{4}\d{1})\d{4}\z|\A0[789]0\d{4}\d{4}\z/
    it { expect(foster_parent_recruiter.tel).to match(VALID_RECRUITER_TEL_REGEX) }
  
  end

  describe "メールアドレスの有効性" do
  
    it "無効なメールアドレスの場合" do
      invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. 
                            foo@bar_baz.com foo@bar+baz.com]
      invalid_addresses.each do |invalid_address|
        foster_parent_recruiter.email = invalid_address
        expect(foster_parent_recruiter).to_not be_valid
      end
    end
  
    it "有効なメールアドレスの場合" do
      valid_addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      valid_addresses.each do |valid_address|
        foster_parent_recruiter.email = valid_address
        expect(foster_parent_recruiter).to be_valid
      end
    end
    
    it "重複したメールアドレスなら無効" do 
      FactoryBot.create(:foster_parent_recruiter, email: "aaron@example.com")
      foster_parent_recruiter = FactoryBot.build(:foster_parent_recruiter, email: "Aaron@example.com")
      foster_parent_recruiter.invalid?
    end
    
  end

  describe "パスワード確認の一致" do
    
    it "一致する場合" do
      foster_parent_recruiter = FactoryBot.build(:foster_parent_recruiter, password: "password", password_confirmation: "password")
      expect(foster_parent_recruiter).to be_valid
    end

    it "一致しない場合" do
      foster_parent_recruiter = FactoryBot.build(:foster_parent_recruiter, password: "password", password_confirmation: "different")
      foster_parent_recruiter.invalid?
    end
  end

end
