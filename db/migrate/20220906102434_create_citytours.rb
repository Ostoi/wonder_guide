class CreateCitytours < ActiveRecord::Migration[7.0]
  def change
    create_table :citytours do |t|
      t.string :name
      t.string :country
      t.text :overview
      t.float :price
      t.float :average_rating
      t.references :guide, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
