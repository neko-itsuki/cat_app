require 'rails_helper'

RSpec.describe Center, type: :model do
  
  let(:center) {FactoryBot.create(:center)}
  
  describe "Centerの保存のテスト" do
    it "Centerの有効性" do
      expect(center).to be_valid
    end
  end
  
  describe "Centerのバリデーションテスト" do
    
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_length_of(:name).is_at_most(25) }
    
    it { is_expected.to validate_presence_of :furigana_name }
    it { is_expected.to validate_length_of(:furigana_name).is_at_most(50) }
    
    it { is_expected.to validate_presence_of :email}
    it { is_expected.to validate_length_of(:email).is_at_most(255) }
    
    it { is_expected.to validate_presence_of :password }
    it { is_expected.to validate_length_of(:password).is_at_least(6).is_at_most(128) }
    
    it { is_expected.to validate_presence_of :director_name }
    it { is_expected.to validate_length_of(:director_name).is_at_most(25) }
    
    it { is_expected.to validate_presence_of :staff_name }
    it { is_expected.to validate_length_of(:staff_name).is_at_most(25) }
    
    VALID_CENTER_TEL_REGEX = /\A0(\d{1}\d{4}|\d{2}\d{3}|\d{3}\d{2}|\d{4}\d{1})\d{4}\z|\A0[789]0\d{4}\d{4}\z/
    it { expect(center.tel).to match(VALID_CENTER_TEL_REGEX) }
    
    it { is_expected.to have_many(:cats).dependent(:destroy) }
  end

  describe "メールアドレスの有効性" do
  
    it "無効なメールアドレスの場合" do
      invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. 
                            foo@bar_baz.com foo@bar+baz.com]
      invalid_addresses.each do |invalid_address|
        center.email = invalid_address
        expect(center).to_not be_valid
      end
    end
  
    it "有効なメールアドレスの場合" do
      valid_addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      valid_addresses.each do |valid_address|
        center.email = valid_address
        expect(center).to be_valid
      end
    end
    
    it "重複したメールアドレスなら無効" do 
      FactoryBot.create(:center, email: "aaron@example.com")
      center = FactoryBot.build(:center, email: "Aaron@example.com")
      center.invalid?
    end
    
  end

  describe "パスワード確認の一致" do
    
    it "一致する場合" do
      center = FactoryBot.build(:center, password: "password", password_confirmation: "password")
      expect(center).to be_valid
    end

    it "一致しない場合" do
      center = FactoryBot.build(:center, password: "password", password_confirmation: "different")
      center.invalid?
    end
  end
  
end
