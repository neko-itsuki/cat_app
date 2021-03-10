class CreateDogs < ActiveRecord::Migration[6.0]
  def change
    create_table :dogs do |t|
      t.references :center, null: false, foreign_key: true
      
      t.string :dog_name, null: false
      t.string :dog_type, null: false
      t.boolean :dog_gender, null: false
      t.string :dog_age, null: false
      t.string :dog_weight, null: false
      t.string :dog_coat_color, null: false
      t.boolean :dog_contraceptive_castrated, null: false
      t.boolean :dog_microchip, null: false
      t.boolean :dog_vaccination, null: false
      t.text :dog_one_thing, null: false
      t.text :dog_health, null: false
      t.text :dog_personality, null: false
      t.text :dog_history_of_protection, null: false
      t.text :dog_remarks

      t.timestamps
    end
    add_index :dogs, [:center_id, :created_at]
  end
end
