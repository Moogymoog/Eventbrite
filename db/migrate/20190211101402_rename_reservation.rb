class RenameReservation < ActiveRecord::Migration[5.2]
  def change
    rename_table :reservations, :attendances
  end 
end
