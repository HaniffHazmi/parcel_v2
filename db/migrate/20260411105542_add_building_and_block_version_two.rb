class AddBuildingAndBlockVersionTwo < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :building, :integer
    add_column :users, :block, :integer
  end
end
