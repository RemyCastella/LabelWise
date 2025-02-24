class CreateFoods < ActiveRecord::Migration[7.1]
  def change
    create_table :foods do |t|
      t.string :name
      t.integer :calories
      t.integer :protein
      t.integer :carbohydrates
      t.integer :fat
      t.integer :sodium
      t.boolean :vegetarian, default: false
      t.boolean :vegan, default: false
      t.boolean :keto, default: false
      t.boolean :pork, default: false
      t.boolean :beef, default: false
      t.boolean :gluten, default: false
      t.boolean :lactose, default: false
      t.string :other_ingredients

      t.timestamps
    end
  end
end
