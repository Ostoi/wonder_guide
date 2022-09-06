class AddUserToCitytours < ActiveRecord::Migration[7.0]
  def change
    add_reference :citytours, :user, null: false, foreign_key: true
  end
end
