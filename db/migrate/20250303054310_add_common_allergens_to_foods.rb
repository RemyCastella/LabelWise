class AddCommonAllergensToFoods < ActiveRecord::Migration[7.1]
  def change
    add_column :foods, :common_allergens, :string, array: true, default: []
  end
end
