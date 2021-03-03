class AddImageIdToDogs < ActiveRecord::Migration[6.0]
  def change
    add_column :dogs, :dog_image, :string, null: false
  end
end
