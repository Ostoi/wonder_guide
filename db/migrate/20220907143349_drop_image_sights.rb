class DropImageSights < ActiveRecord::Migration[7.0]
  def change
    remove_column :sights, :image, :string
  end
end
