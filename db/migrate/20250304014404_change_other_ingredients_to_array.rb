class ChangeOtherIngredientsToArray < ActiveRecord::Migration[7.1]
  def change
    change_column :users, :other_ingredients, "varchar[] USING (string_to_array(other_ingredients, ','))"
  end
end
