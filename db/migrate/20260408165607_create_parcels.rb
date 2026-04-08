class CreateParcels < ActiveRecord::Migration[8.1]
  def change
    create_table :parcels do |t|
      t.string :tracking_number
      t.references :student, null: false, foreign_key: { to_table: :users }
      t.string :courier
      t.integer :status
      t.datetime :received_at
      t.datetime :delivered_at

      t.timestamps
    end
    add_index :parcels, :tracking_number
  end
end
