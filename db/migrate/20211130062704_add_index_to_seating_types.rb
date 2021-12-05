class AddIndexToSeatingTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :seating_types, :seat_category, :string
    add_index :seating_types, :seat_category, unique: true
  end
end
