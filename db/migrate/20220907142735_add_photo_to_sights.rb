class AddPhotoToSights < ActiveRecord::Migration[7.0]
  def change
    add_column :sights, :photo, :string
  end
end
