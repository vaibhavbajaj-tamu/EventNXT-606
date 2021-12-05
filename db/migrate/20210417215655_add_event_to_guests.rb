class AddEventToGuests < ActiveRecord::Migration[5.2]
  def change
    add_reference :guests, :event, index: true, foreign_key: true
  end
end
