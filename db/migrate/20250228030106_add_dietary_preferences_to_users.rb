class AddDietaryPreferencesToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :calories, :integer
    add_column :users, :protein, :integer
    add_column :users, :carbohydrates, :integer
    add_column :users, :fat, :integer
    add_column :users, :sodium, :integer
  end
end
