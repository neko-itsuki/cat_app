class CreateCats < ActiveRecord::Migration[6.0]
  def change
    create_table :cats do |t|
      t.string :cat_name, null: false
      t.string :cat_type, null: false
      t.boolean :cat_gender, null: false
      t.string :cat_age, null: false
      t.string :cat_weight, null: false
      t.string :cat_coat_color, null: false
      t.boolean :cat_contraceptive_castrated, null: false
      t.boolean :cat_microchip, null: false
      t.boolean :cat_vaccination, null: false
      t.text :cat_one_thing, null: false
      t.text :cat_health, null: false
      t.text :cat_personality, null: false
      t.text :cat_history_of_protection, null: false
      t.text :cat_remarks
      t.text :cat_center_information, null: false
      
      t.references :center, null: false, foreign_key: true

      t.timestamps
    end
    add_index :cats, [:center_id, :created_at]
  end
end
