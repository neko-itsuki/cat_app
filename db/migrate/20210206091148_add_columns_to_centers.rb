class AddColumnsToCenters < ActiveRecord::Migration[6.0]
  def change
    add_column :centers, :postcode, :integer, null: false
    add_column :centers, :prefecture_code, :integer, null: false
    add_column :centers, :address_city, :string, null: false
    add_column :centers, :address_street, :string, null: false
    add_column :centers, :address_building, :string
  end
end
