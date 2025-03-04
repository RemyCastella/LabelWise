class ChangeLatLngToFloatInScans < ActiveRecord::Migration[7.1]
  def change
    change_column :scans, :lat, :float
    change_column :scans, :lng, :float
  end
end
