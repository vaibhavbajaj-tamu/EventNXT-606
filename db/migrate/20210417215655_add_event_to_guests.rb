class AddEventToGuests < ActiveRecord::Migration
  def change
    add_reference :guests, :event, index: true, foreign_key: true
  end
end
