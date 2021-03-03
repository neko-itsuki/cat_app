class Notification < ApplicationRecord
  
  default_scope -> { order(created_at: :desc) }
  belongs_to :user_message
  belongs_to :user_visitor, class_name: 'User', foreign_key: 'visitor_id', optional: true
  belongs_to :user_visited, class_name: 'User', foreign_key: 'visited_id', optional: true
  belongs_to :center_visitor, class_name: 'Center', foreign_key: 'visitor_id', optional: true
  belongs_to :center_visited, class_name: 'Center', foreign_key: 'visited_id', optional: true
   
end
