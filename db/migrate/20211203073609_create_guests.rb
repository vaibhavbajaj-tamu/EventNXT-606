class CreateGuests < ActiveRecord::Migration[5.2]
  def change
    create_table :guests do |t|
      t.string :email_address
      t.string :first_name
      t.string :last_name
      t.string :affiliation
      t.string :added_by
      t.string :guest_type
      t.string :seat_category
      t.integer :max_seats_num
      t.string :booking_status, default:"Not invited"
      t.integer :total_booked_num, default:0
      t.references :event, foreign_key: true
    end
  end
end