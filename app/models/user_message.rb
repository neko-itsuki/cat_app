class UserMessage < ApplicationRecord
  
  belongs_to :user, optional: true
  belongs_to :center, optional: true
  belongs_to :user_room
  has_many :notifications, dependent: :destroy
  
  validates :user_message, presence: true
  
end
