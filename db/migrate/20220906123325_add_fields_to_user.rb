class AddFieldsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :nickname, :string
    add_column :users, :payment_details, :text
    add_column :users, :country, :string
    add_column :users, :guide, :boolean
  end
end
