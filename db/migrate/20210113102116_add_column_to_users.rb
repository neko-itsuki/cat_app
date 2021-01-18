class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :furigana_name, :string, null: false
    add_column :users, :age, :integer, null: false
    add_column :users, :gender, :boolean, null: false
    add_column :users, :street_address, :string, null: false
    add_column :users, :tel, :string, null: false
    add_column :users, :pets_allowed, :boolean
    add_column :users, :living, :boolean
    add_column :users, :vaccination, :boolean
  end
end
