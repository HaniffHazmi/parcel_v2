class AddDormFieldsToUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :name, :string
    add_column :users, :matric_id, :string
    add_column :users, :level, :integer
    add_column :users, :room_number, :integer
    add_column :users, :phone_number, :string
  end
end
