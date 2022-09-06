class CreateCitytours < ActiveRecord::Migration[7.0]
  def change
    create_table :citytours do |t|
      t.string :name
      t.text :overview
      t.float :price

      t.timestamps
    end
  end
end
