class AddColumnToCenters < ActiveRecord::Migration[6.0]
  def change
    add_column :centers, :name, :string, null: false
    add_column :centers, :furigana_name, :string, null: false
    add_column :centers, :director_name, :string, null: false
    add_column :centers, :staff_name, :string, null: false
    add_column :centers, :street_address, :string, null: false
    add_column :centers, :tel, :string, null: false
    add_column :centers, :care_time, :string
    add_column :centers, :close_date, :string
    add_column :centers, :acces, :string
    add_column :centers, :url, :string
    add_column :centers, :director_word, :text
  end
end
