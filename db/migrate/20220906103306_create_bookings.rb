class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.timestamp :start
      t.timestamp :end

      t.references :user, null: false, foreign_key: true
      t.references :citytour, null: false, foreign_key: true

      t.timestamps
    end
  end
end
