require 'rails_helper'

RSpec.describe Cat, type: :model do
  
  let(:cat) {FactoryBot.create(:cat)}
  
  describe "Catの保存のテスト" do
    it "Catの有効性" do
      expect(cat).to be_valid
    end
  end
  
  describe "Catのバリデーションテスト" do
    
    it { is_expected.to validate_presence_of :cat_name }
    it { is_expected.to validate_length_of(:cat_name).is_at_most(10) }
    
    it { is_expected.to validate_presence_of :cat_type }
    it { is_expected.to validate_presence_of :cat_gender }
    it { is_expected.to validate_presence_of :cat_age }
    it { is_expected.to validate_presence_of :cat_weight }
    it { is_expected.to validate_presence_of :cat_coat_color }
    it { is_expected.to validate_presence_of :cat_image }
    it { is_expected.to validate_presence_of :cat_contraceptive_castrated }
    it { is_expected.to validate_presence_of :cat_microchip }
    it { is_expected.to validate_presence_of :cat_vaccination }
    it { is_expected.to validate_presence_of :cat_one_thing }
    it { is_expected.to validate_presence_of :cat_health }
    it { is_expected.to validate_presence_of :cat_personality }
    it { is_expected.to validate_presence_of :cat_history_of_protection }

    it { is_expected.to belong_to(:center) }
  end
end
