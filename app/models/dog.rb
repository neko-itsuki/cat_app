class Dog < ApplicationRecord
  belongs_to :center
  
  attachment :dog_image
  
  validates :dog_name, presence: true,
                   length: { maximum: 10 }
  validates :dog_type, presence: true
  validates :dog_gender, presence: true
  validates :dog_age, presence: true
  validates :dog_weight, presence: true
  validates :dog_coat_color, presence: true
  validates :dog_contraceptive_castrated, presence: true
  validates :dog_microchip, presence: true
  validates :dog_vaccination, presence: true
  validates :dog_one_thing, presence: true
  validates :dog_health, presence: true
  validates :dog_personality, presence: true
  validates :dog_history_of_protection, presence: true
  validates :dog_center_information, presence: true
end
