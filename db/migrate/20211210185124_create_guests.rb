class CreateGuests < ActiveRecord::Migration[5.2]
  def change
    create_table :guests do |t|
      t.string :email_address
      t.string :first_name
      t.integer :event_id
      t.string :last_name
      t.string :affiliation
      t.string :added_by
      t.string :guest_type
      t.string :seat_category
      t.integer :max_seats_num
      t.string :booking_status
      t.integer :total_booked_num
      t.index ["event_id"], name: "index_guests_on_event_id"

      t.timestamps
    end
  end
end
