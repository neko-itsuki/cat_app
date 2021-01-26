require 'rails_helper'

RSpec.describe Dog, type: :model do
  
  let(:dog) {FactoryBot.create(:dog)}
  
  describe "Dogの保存のテスト" do
    it "Dogの有効性" do
      expect(dog).to be_valid
    end
  end
  
  describe "Dogのバリデーションテスト" do
  
  it { is_expected.to validate_presence_of :dog_name }
  it { is_expected.to validate_length_of(:dog_name).is_at_most(10) }
  
  it { is_expected.to validate_presence_of :dog_type }
  it { is_expected.to validate_presence_of :dog_gender }
  it { is_expected.to validate_presence_of :dog_age }
  it { is_expected.to validate_presence_of :dog_weight }
  it { is_expected.to validate_presence_of :dog_coat_color }
  it { is_expected.to validate_presence_of :dog_contraceptive_castrated }
  it { is_expected.to validate_presence_of :dog_microchip }
  it { is_expected.to validate_presence_of :dog_vaccination }
  it { is_expected.to validate_presence_of :dog_one_thing }
  it { is_expected.to validate_presence_of :dog_health }
  it { is_expected.to validate_presence_of :dog_personality }
  it { is_expected.to validate_presence_of :dog_history_of_protection }
  it { is_expected.to validate_presence_of :dog_center_information }
  
  it { is_expected.to belong_to(:center) }
  end
end
