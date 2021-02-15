class UserRoom < ApplicationRecord
  
  belongs_to :user
  belongs_to :center
  belongs_to :cat, optional: true
  belongs_to :dog, optional: true
  has_many :user_messages, dependent: :destroy
  
  validates :user_id, uniqueness: true, allow_nil: true
  validates :center_id, uniqueness: true, allow_nil: true
  validates :cat_id, uniqueness: true, allow_nil: true
  validates :dog_id, uniqueness: true, allow_nil: true
  
end
