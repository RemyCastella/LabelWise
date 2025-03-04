class AddLngToScans < ActiveRecord::Migration[7.1]
  def change
    add_column :scans, :lng, :integer
  end
end
