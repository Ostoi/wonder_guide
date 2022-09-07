class ChangeLocationToFloat < ActiveRecord::Migration[7.0]
  def change
    change_column :sights, :longitude, :float
    change_column :sights, :latitude, :float
  end
end
