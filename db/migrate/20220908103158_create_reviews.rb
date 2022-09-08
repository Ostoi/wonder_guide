class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :reviewtext
      t.references :booking, null: false, foreign_key: true
      t.boolean :isguide

      t.timestamps
    end
  end
end
