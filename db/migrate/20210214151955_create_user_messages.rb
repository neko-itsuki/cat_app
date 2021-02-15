class CreateUserMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :user_messages do |t|
      t.references :user_room, null: false, foreign_key: true
      t.references :user, foreign_key: true
      t.references :center, foreign_key: true
      t.text :user_message, null: false
      t.timestamps
    end
  end
end
