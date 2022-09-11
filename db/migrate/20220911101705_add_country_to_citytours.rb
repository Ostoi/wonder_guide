class AddCountryToCitytours < ActiveRecord::Migration[7.0]
  def change
    add_column :citytours, :country, :string
  end
end
