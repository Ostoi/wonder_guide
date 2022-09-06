class CreateCitytourSights < ActiveRecord::Migration[7.0]
  def change
    create_table :citytour_sights do |t|
      t.references :citytour, null: false, foreign_key: true
      t.references :sight, null: false, foreign_key: true

      t.timestamps
    end
  end
end
