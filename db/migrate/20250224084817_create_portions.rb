class CreatePortions < ActiveRecord::Migration[7.1]
  def change
    create_table :portions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :food, null: false, foreign_key: true
      t.float :portion_size

      t.timestamps
    end
  end
end
