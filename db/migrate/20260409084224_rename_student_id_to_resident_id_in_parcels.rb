class RenameStudentIdToResidentIdInParcels < ActiveRecord::Migration[8.1]
  def change
    rename_column :parcels, :student_id, :resident_id
  end
end
