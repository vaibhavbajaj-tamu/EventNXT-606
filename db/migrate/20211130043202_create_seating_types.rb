class CreateSeatingTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :seating_types do |t|
      t.string :seat_category
      t.integer :total_seat_count
      t.integer :vip_seat_count
      t.integer :box_office_seat_count
      t.integer :balance_seats
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
