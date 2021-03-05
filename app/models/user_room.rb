class UserRoom < ApplicationRecord
  
  belongs_to :user
  belongs_to :center
  belongs_to :cat, optional: true
  belongs_to :dog, optional: true
  has_many :user_messages, dependent: :destroy
  
  validates :user_id, presence: true
  validates :center_id, presence: true
  
end
