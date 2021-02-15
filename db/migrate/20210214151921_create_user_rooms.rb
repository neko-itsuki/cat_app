class CreateUserRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :user_rooms do |t|
      t.references :user, foreign_key: true
      t.references :center, foreign_key: true
      t.references :cat
      t.references :dog
      t.timestamps
    end
  end
end
