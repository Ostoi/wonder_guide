class CreateSights < ActiveRecord::Migration[7.0]
  def change
    create_table :sights do |t|
      t.string :name
      t.string :city
      t.text :address
      t.float :longitude
      t.float :latitude
      t.references :guide, null: false, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
