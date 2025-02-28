class AddCommonAllergensAndOtherIngredientsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :common_allergens, :text
    add_column :users, :other_ingredients, :text
  end
end
