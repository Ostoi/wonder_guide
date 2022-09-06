class AddUserToCitytours < ActiveRecord::Migration[7.0]
  def change
    change_table :citytours do |t|
      t.references :guide, null: false, foreign_key: { to_table: :users }
    end
  end
end
