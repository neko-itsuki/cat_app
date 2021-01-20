class Cat < ApplicationRecord
  belongs_to :center
  
  validates :name, presence: true,
                   length: { maximum: 10 }
  validates :type, presence: true
  validates :gender, presence: true
  validates :age, presence: true
  validates :weight, presence: true
  validates :coat_color, presence: true
  validates :contraceptive_castrated, presence: true
  validates :microchip, presence: true
  validates :vaccination, presence: true
  validates :one_thing, presence: true
  validates :health, presence: true
  validates :personality, presence: true
  validates :history_of_protection, presence: true
  validates :center_information, presence: true
end
