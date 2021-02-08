class AddImageIdToDogs < ActiveRecord::Migration[6.0]
  def change
    add_column :dogs, :dog_image_id, :string, null: false
  end
end
