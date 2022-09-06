class CreateSights < ActiveRecord::Migration[7.0]
  def change
    create_table :sights do |t|
      t.string :name
      t.string :city
      t.text :address
      t.decimal :longitude
      t.decimal :latitude
      t.timestamps
    end
  end
end
