class CreateReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :hotel_id
      t.integer :time_slot_id
      t.string :customer_name
      t.string :customer_email
      t.string :customer_phone
      t.string :persons_size
      t.date :reservation_date

      t.timestamps
    end
  end
end
