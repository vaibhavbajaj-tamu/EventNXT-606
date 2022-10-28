class BoxOfficeData < ActiveRecord::Migration[7.0]
  def change
    create_table :box_office_data, force: :cascade do |t|
      t.references :event, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :email, null: false
      t.string :first_name
      t.string :last_name
      t.string :referral_code
      t.datetime :referral_expiration
      t.datetime :emailed_at
    end
    add_index :box_office_data, [:email, :event_id], unique: true
  end
end