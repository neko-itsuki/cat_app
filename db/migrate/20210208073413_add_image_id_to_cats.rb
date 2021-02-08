class AddImageIdToCats < ActiveRecord::Migration[6.0]
  def change
    add_column :cats, :cat_image_id, :string, null: false
  end
end
