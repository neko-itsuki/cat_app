class AddColumnsToFosterParentRecruiters < ActiveRecord::Migration[6.0]
  def change
    add_column :foster_parent_recruiters, :postcode, :integer, null: false
    add_column :foster_parent_recruiters, :prefecture_code, :integer, null: false
    add_column :foster_parent_recruiters, :address_city, :string, null: false
    add_column :foster_parent_recruiters, :address_street, :string, null: false
    add_column :foster_parent_recruiters, :address_building, :string
  end
end
