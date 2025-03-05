class SetDefaultTargetValuesForUsers < ActiveRecord::Migration[7.1]
  def change
    change_column_default :users, :protein, 100
    change_column_default :users, :carbohydrates, 250
    change_column_default :users, :fat, 60
    change_column_default :users, :calories, 2000
  end
end
