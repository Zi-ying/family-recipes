class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :food_type
      t.text :ingredient
      t.text :food_recipe
      t.integer :baking_temperature
      t.integer :preparation_time
      t.integer :cooking_time
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
