require 'rails_helper'

RSpec.describe Cat, type: :model do
  
  let(:cat) {FactoryBot.create(:cat)}
  
  describe "Catの保存のテスト" do
    it "Catの有効性" do
      expect(cat).to be_valid
    end
  end
  
  describe "userのバリデーションテスト" do
    
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_length_of(:name).is_at_most(10) }
    
    it { is_expected.to validate_presence_of :type }
    it { is_expected.to validate_presence_of :gender }
    it { is_expected.to validate_presence_of :age }
    it { is_expected.to validate_presence_of :weight }
    it { is_expected.to validate_presence_of :coat_color }
    it { is_expected.to validate_presence_of :contraceptive_castrated }
    it { is_expected.to validate_presence_of :microchip }
    it { is_expected.to validate_presence_of :vaccination }
    it { is_expected.to validate_presence_of :one_thing }
    it { is_expected.to validate_presence_of :health }
    it { is_expected.to validate_presence_of :personality }
    it { is_expected.to validate_presence_of :history_of_protection }
    it { is_expected.to validate_presence_of :center_information }
    
    it { is_expected.to belong_to(:center) }
  end
end
