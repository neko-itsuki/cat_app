class Cat < ApplicationRecord
  
  default_scope -> { order(created_at: :desc) }
  belongs_to :center
  has_one :user_room, dependent: :destroy
  
  mount_uploader :cat_image, CatImageUploader
  
  validates :cat_name, presence: true,
                   length: { maximum: 10 }
  validates :cat_type, presence: true
  validates :cat_gender, presence: true
  validates :cat_age, presence: true
  validates :cat_weight, presence: true
  validates :cat_coat_color, presence: true
  validates :cat_contraceptive_castrated, presence: true
  validates :cat_microchip, presence: true
  validates :cat_vaccination, presence: true
  validates :cat_one_thing, presence: true
  validates :cat_health, presence: true
  validates :cat_personality, presence: true
  validates :cat_history_of_protection, presence: true
end
