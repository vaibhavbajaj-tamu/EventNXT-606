class DropGuestsTable2 < ActiveRecord::Migration[5.2]
  
  def up
    drop_table :guests
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end