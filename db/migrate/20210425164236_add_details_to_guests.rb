class AddDetailsToGuests < ActiveRecord::Migration[5.2]
  def change
    remove_column :guests, :name, :string
    add_column :guests, :first_name, :string
    add_column :guests, :last_name, :string
    add_column :guests, :affiliation, :string
    add_column :guests, :added_by, :string
    add_column :guests, :guest_type, :string
    add_column :guests, :seat_category, :string
    add_column :guests, :max_seats_num, :integer
    add_column :guests, :booking_status, :string
    add_column :guests, :total_booked_num, :integer
  end
end
