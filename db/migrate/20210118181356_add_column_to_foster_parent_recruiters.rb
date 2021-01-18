class AddColumnToFosterParentRecruiters < ActiveRecord::Migration[6.0]
  def change
    add_column :foster_parent_recruiters, :name, :string, null: false
    add_column :foster_parent_recruiters, :furigana_name, :string, null: false
    add_column :foster_parent_recruiters, :age, :integer, null: false
    add_column :foster_parent_recruiters, :gender, :boolean, null: false
    add_column :foster_parent_recruiters, :street_address, :string, null: false
    add_column :foster_parent_recruiters, :tel, :string, null: false
    add_column :foster_parent_recruiters, :tel_time, :string
    add_column :foster_parent_recruiters, :animal_type, :string, null: false
    add_column :foster_parent_recruiters, :animal_gender, :string, null: false
    add_column :foster_parent_recruiters, :animal_age, :string, null: false
    add_column :foster_parent_recruiters, :animal_image, :string, null: false
    add_column :foster_parent_recruiters, :reason, :string, null: false
  end
end
