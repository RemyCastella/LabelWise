class ChangeCommonAllergensToAnArray < ActiveRecord::Migration[7.1]
  def change
    change_column :users, :common_allergens, "varchar[] USING (string_to_array(common_allergens, ','))"

  end
end
