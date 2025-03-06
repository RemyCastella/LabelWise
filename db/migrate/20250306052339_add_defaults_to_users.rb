class AddDefaultsToUsers < ActiveRecord::Migration[7.1]
  def change
    change_column_default :users, :common_allergens, []
    change_column_default :users, :other_ingredients, []
  end
end
