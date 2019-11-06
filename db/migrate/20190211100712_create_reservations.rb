class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.string :stripe_customer_id
      t.references :guest, index: true
      t.references :events, foreign_key: true
      t.timestamps
    end
  end
end
