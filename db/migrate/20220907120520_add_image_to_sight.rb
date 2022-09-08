class AddImageToSight < ActiveRecord::Migration[7.0]
  def change
    add_column :sights, :image, :string
  end
end
