class AddSeatCategoryToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :seat_category, :string
  end
end
