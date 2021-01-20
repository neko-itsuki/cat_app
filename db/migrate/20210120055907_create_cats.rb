class CreateCats < ActiveRecord::Migration[6.0]
  def change
    create_table :cats do |t|
      t.string :name, null: false
      t.string :type, null: false
      t.boolean :gender, null: false
      t.string :age, null: false
      t.string :weight, null: false
      t.string :coat_color, null: false
      t.boolean :contraceptive_castrated, null: false
      t.boolean :microchip, null: false
      t.boolean :vaccination, null: false
      t.text :one_thing, null: false
      t.text :health, null: false
      t.text :personality, null: false
      t.text :history_of_protection, null: false
      t.text :remarks
      t.text :center_information, null: false
      
      t.references :center, null: false, foreign_key: true

      t.timestamps
    end
    add_index :cats, [:center_id, :created_at]
  end
end
