class AddColumnsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :gender, :string
    add_column :users, :age, :integer
    add_column :users, :vegetarian, :boolean, default: false
    add_column :users, :vegan, :boolean, default: false
    add_column :users, :keto, :boolean, default: false
    add_column :users, :high_protein, :boolean, default: false
    add_column :users, :pork, :boolean, default: false
    add_column :users, :beef, :boolean, default: false
    add_column :users, :gluten, :boolean, default: false
    add_column :users, :lactose, :boolean, default: false
    add_column :users, :low_sodium, :boolean, default: false
    add_column :users, :low_fat, :boolean, default: false
    add_column :users, :low_carbs, :boolean, default: false
  end
end
