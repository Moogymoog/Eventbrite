class RenameColumnReservation < ActiveRecord::Migration[5.2]
  def change
    rename_column :attendances, :events_id, :event_id
  end
end
