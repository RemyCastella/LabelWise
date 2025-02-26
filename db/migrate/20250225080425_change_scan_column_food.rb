class ChangeScanColumnFood < ActiveRecord::Migration[7.1]
  def change
    change_column_null :scans, :food_id, true
  end
end
