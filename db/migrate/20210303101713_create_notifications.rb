class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.timestamps
      t.integer 'visitor_id', null: false
      t.integer 'visited_id', null: false
      t.boolean 'checked', default: false, null: false
      t.integer 'message_id', null: false
    end
  end
end
