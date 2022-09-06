class AddGuideToSight < ActiveRecord::Migration[7.0]
  def change
    add_reference :sights, :user, null: false, foreign_key: true
  end
end
