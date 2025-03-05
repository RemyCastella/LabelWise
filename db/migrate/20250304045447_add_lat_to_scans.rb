class AddLatToScans < ActiveRecord::Migration[7.1]
  def change
    add_column :scans, :lat, :integer
  end
end
