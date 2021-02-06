class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :postcode, :integer, null: false
    add_column :users, :prefecture_code, :integer, null: false
    add_column :users, :address_city, :string, null: false
    add_column :users, :address_street, :string, null: false
    add_column :users, :address_building, :string
  end
end
