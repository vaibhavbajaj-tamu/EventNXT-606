class RemoveSeatCategoryFromSeatingTypes < ActiveRecord::Migration[5.2]
  def change
    remove_column :seating_types, :seat_category, :string
  end
end
